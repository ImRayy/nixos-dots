{
    wayland.windowManager.hyprland.settings = {
        exec-once = [
            "waybar"
            "swww init"
            "swayosd-server"
            "wl-paste --watch cliphist store"
            "run xhost +SI:localuser:root"
            "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"
        ];
    };
}
