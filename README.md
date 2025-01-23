## dotfiles for my hyprland/eww setup
very simple, but mostly functional and usable for everyday stuff. most topbar elements also have tooltips (not pictured). includes:
- working volume buttons
- working mute/unmute button (virtual also, in topbar)
- working brightness buttons (intel)
- working spotify info in topbar
- autojump to window for chrome, spotify, vscode
- fully functional topbar
- wifi info
- working hyprlock config (not pictured)
- mini sliding menus in topbar
- integrated wofi using hyprland plugin
<br /><br />

I use this setup on arch for my school laptop and it works perfectly fine for most things. the audio setup is very questionable and the camera does not work. this project is shockingly time consuming and also slightly frustrating.

more stuff to come eventually. this project is a work in progress that I only touch when I am not busy with school/work (which is rarely)

![screenshot 1](https://i.imgur.com/rqpgpPG.png)
![screenshot 2](https://i.imgur.com/Qz217Vb.png)

### things to do before it works
1. build hyprland from source and install headers:
    ```bash
    cd /hyprland build directory/
    make all && sudo make install && sudo make installheaders
    ```
1. build hyprland plugin:
    - make sure pkg-config is installed since plugin makefile uses pkg-config to find hyprland headers
    - build plugin
        ```bash
        cd hypr/plugin
        make
        ```

### list of packages (install with yay)
there may be missing hyprland deps, building hyprland will fail and tell you what to install. `yay -S /package/-git` should work for most (if not all) missing hyprland deps
```
alacritty
eww-wayland-git
fastfetch
feh
fff
google-chrome
grub
hostapd
hsetroot
hyprland-git
hyprlock-git
hyprpaper-git
hyprshot-git
hyprutils-git
hyprwayland-scanner-git
inkscape
intel-ucode
iw
iwd
laptop-mode-tools
man-db
man-pages
nano
networkmanager
ntp
nwg-look
openssh
perl-anyevent-i3
pipewire-alsa
pipewire-pulse
playerctl
postgresql
python-dbus
python-pip
qt5-wayland
slack-desktop
sof-firmware
spotify
ttf-cascadia-code-nerd
ttf-cascadia-mono-nerd
ttf-inconsolata-nerd
unzip
valgrind
visual-studio-code-bin
vlc
wget
windows-10-cursor
xorg-mkfontscale
xorg-server
xorg-xev
xorg-xinit
xorg-xsetroot
zsh
```
