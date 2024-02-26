{ pkgs, inputs, ... }:

{
    home.packages = with pkgs; [ xdg-desktop-portal-hyprland ];
    wayland.windowManager.hyprland = {
        enable = true;
        package = inputs.hyprland.packages."${pkgs.system}".hyprland;
    };

    imports = [
        ./extraConfig.nix
        ./hyprland.nix
        ./keybindings.nix
        ./startup.nix
        ./windowrules.nix
    ];
}
