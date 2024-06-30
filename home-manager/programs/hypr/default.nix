{lib, pkgs, inputs, systemConfig, ... }:

let 
    wm = systemConfig.windowManager;
    enabled = wm == "hyprland" || wm == "all";
in

{
    imports = lib.optionals enabled [
        ./extraConfig.nix
        ./hyprland.nix
        ./hyprlock.nix
        ./keybindings.nix
        ./startup.nix
        ./windowrules.nix
    ];

    home.packages = with pkgs; lib.optionals enabled [ xdg-desktop-portal-hyprland hyprpaper hypridle ];
    wayland.windowManager.hyprland = {
        enable = enabled;
    };
}
