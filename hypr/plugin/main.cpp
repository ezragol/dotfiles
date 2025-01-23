#include <hyprland/src/plugins/PluginAPI.hpp>
#include <hyprland/src/desktop/Window.hpp>
#include <hyprland/src/Compositor.hpp>
#include <hyprland/src/config/ConfigManager.hpp>
#include <cstdlib>

inline HANDLE PHANDLE = nullptr;
const std::string zero = "0.0";

APICALL EXPORT std::string PLUGIN_API_VERSION()
{
    return HYPRLAND_API_VERSION;
}

int writeToFile(std::string path, std::string contents)
{
    std::ofstream outfile(path);

    if (!outfile.is_open())
    {
        std::cerr << "Error opening file!" << std::endl;
        return 1;
    }

    outfile << contents << std::endl;

    outfile.close();
    return 0;
}

void exec(const char *command)
{
    pid_t pid;
    int status = 0;
    pid = fork();
    if (pid == 0)
    {
        system(command);
        exit(1);
    }
    wait(&status);
}

void windowCloseOverride()
{
    std::string cmd = "exec /home/ezra/.config/eww/wclose.sh";
    HyprlandAPI::invokeHyprctlCommand("dispatch", cmd, "");
}

void windowOpened(PHLWINDOW window)
{
    if (window->m_szClass == "wofi")
    {
        std::string cmd = "exec /home/ezra/.config/eww/wopen.sh " + window->m_szClass;
        HyprlandAPI::invokeHyprctlCommand("dispatch", cmd, "");
    }
    else
        windowCloseOverride();
}

void windowClosed(PHLWINDOW window)
{
    if (window->m_szClass == "wofi")
        windowCloseOverride();
}

APICALL EXPORT PLUGIN_DESCRIPTION_INFO PLUGIN_INIT(HANDLE handle)
{
    PHANDLE = handle;

    const std::string HASH = __hyprland_api_get_hash();

    // ALWAYS add this to your plugins. It will prevent random crashes coming from
    // mismatched header versions.
    if (HASH != GIT_COMMIT_HASH)
    {
        HyprlandAPI::addNotification(PHANDLE, "[Plugin] Mismatched headers! Can't proceed.",
                                     CHyprColor{1.0, 0.2, 0.2, 1.0}, 5000);
        throw std::runtime_error("[Plugin] Version mismatch");
    }

    // remove when done
    HyprlandAPI::addNotification(PHANDLE, "[Plugin] Plugin loaded!",
                                 CHyprColor{0.0, 0.2, 0.2, 1.0}, 1000);

    static auto P = HyprlandAPI::registerCallbackDynamic(PHANDLE, "openWindow", [&](void *self, SCallbackInfo &info, std::any data)
                                                         { windowOpened(std::any_cast<PHLWINDOW>(data)); });
    static auto P1 = HyprlandAPI::registerCallbackDynamic(PHANDLE, "closeWindow", [&](void *self, SCallbackInfo &info, std::any data)
                                                          { windowClosed(std::any_cast<PHLWINDOW>(data)); });
    static auto P2 = HyprlandAPI::registerCallbackDynamic(PHANDLE, "workspace", [&](void *self, SCallbackInfo &info, std::any data)
                                                          { windowCloseOverride(); });

    return {"Plugin", "", "", "0.1"};
}