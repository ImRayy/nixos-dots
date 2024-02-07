{
    wayland.windowManager.hyprland.settings = {
        exec-once = [
            "hyprctl setcursor Bibata-Modern-Ice 24"
            "waybar"
            "swaync"
            "swayosd-server"
            "wl-paste --watch cliphist store"
            "nm-applet --indicator"
            "~/.scripts/set-wal"
            "run xhost +SI:localuser:root"
            "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"
        ];
    };
}
