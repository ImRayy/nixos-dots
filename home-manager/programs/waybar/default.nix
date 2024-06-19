{ lib, homeConfig, systemConfig, ... }:

let
    wm = systemConfig.windowManager;
    useWaybar = wm == "hyprland" || wm == "all";
    enabled = useWaybar && homeConfig.statusBar == "waybar";

in
{
    imports = lib.optionals enabled [
        ./waybar.nix
        ./style.nix
    ];

    programs.waybar.enable = enabled;
}
