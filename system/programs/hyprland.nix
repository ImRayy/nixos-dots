{ lib, config, pkgs, inputs, systemConfig, ... }:


let
    wm = systemConfig.windowManager;
    enabled = lib.mkIf ( wm == "hyprland" || wm == "all" );
in 
enabled {
    programs.hyprland = {
        enable = true;
        xwayland.enable = true;
        portalPackage = pkgs.xdg-desktop-portal-hyprland;
    };

    environment.systemPackages = with pkgs; [
        cliphist
        hyprpicker 
        swayimg
        wl-clipboard
        wlsunset
    ];
}
