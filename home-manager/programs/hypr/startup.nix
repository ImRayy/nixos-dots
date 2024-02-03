{
    wayland.windowManager.hyprland.settings = {
        exec-once = [
            "~/.config/lf/scripts/set_wall.sh"
            "hyprctl setcursor Bibata-Modern-Ice 24"
            "swaync"
            "swayosd-server"
            "wl-paste --watch cliphist store"
            "nm-applet --indicator"
            "run xhost +SI:localuser:root"
            "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"
        ];
    };
}
