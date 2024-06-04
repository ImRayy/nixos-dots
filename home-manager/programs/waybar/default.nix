{ lib, homeConfig, systemConfig, ... }:

let
    wm = systemConfig.windowManager;
    useWaybar = wm == "hyprland" || wm == "all";
    enabled = lib.mkIf (useWaybar && homeConfig.bar == "waybar");

    imports = [
        ./waybar.nix
        ./style.nix
    ];
in
enabled {
    programs.waybar.enable = true;
}
