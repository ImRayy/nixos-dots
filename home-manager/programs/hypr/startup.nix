{ lib, homeConfig, ... }:
let
    bar = homeConfig.statusBar;
    statusBar = if bar != "ags" then "ags --toggle-window 'bar-0' & ${bar}" else "ags";
in
{
    wayland.windowManager.hyprland.settings = with homeConfig; {
        exec-once = [
            "hyprctl setcursor Bibata-Modern-Ice 24"
            "${statusBar}"
            "wl-paste --watch cliphist store"
            "swww init"
            "run xhost +SI:localuser:root"
            "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"
        ];
    };
}
