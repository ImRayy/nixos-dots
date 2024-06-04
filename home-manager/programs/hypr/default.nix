{lib, pkgs, inputs, systemConfig, ... }:

let 
    wm = systemConfig.windowManager;
    enabled = lib.mkIf (wm == "hyprland" || wm == "all");

    imports = [
        ./extraConfig.nix
        ./hyprland.nix
        ./keybindings.nix
        ./startup.nix
        ./windowrules.nix
    ];
in
enabled {
    home.packages = with pkgs; [ xdg-desktop-portal-hyprland hyprpaper ];
    wayland.windowManager.hyprland = {
        enable = true;
        package = inputs.hyprland.packages."${pkgs.system}".hyprland;
    };
}
