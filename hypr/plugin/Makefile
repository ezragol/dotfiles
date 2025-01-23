CXX = g++

plugin.so: main.cpp
	$(CXX) -shared -fPIC $^ -o $@ -g `pkg-config --cflags pixman-1 libdrm hyprland` -std=c++26