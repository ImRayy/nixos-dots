{ homeConfig, ... }:
{
    wayland.windowManager.hyprland.settings = {
        exec-once = [
            "hyprctl setcursor Bibata-Modern-Ice 24"
            "${homeConfig.statusBar}"
            "swww init"
            "swayosd-server"
            "wl-paste --watch cliphist store"
            "run xhost +SI:localuser:root"
            "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"
        ];
    };
}
