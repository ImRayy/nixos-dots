{ pkgs, inputs, ... }:

{
    wayland.windowManager.hyprland = {
        enable = true;
        package = inputs.hyprland.packages."${pkgs.system}".hyprland;
    };

    imports = [
        ./hyprland.nix
        ./keybindings.nix
        ./startup.nix
        ./windowrules.nix
    ];
}
