{ lib, homeConfig, ... }:
let
  statusBar = if homeConfig.waybar then "waybar" else "";
in
{
  wayland.windowManager.hyprland.settings = with homeConfig; {
    exec-once = [
      "hyprpaper"
      "${statusBar}"
      "wl-paste --watch cliphist store"
      "run xhost +SI:localuser:root"
      "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"
      "kdeconnect-indicator"
    ];
  };
}
