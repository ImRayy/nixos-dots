{ config, pkgs, ... }:

{
    imports = [
        ./ags.nix
        ./atuin.nix
        ./fish
        ./gtk.nix
        ./hypr
        ./kitty.nix
        ./lf
        ./mako.nix
        ./misc.nix
        ./mpv.nix
        ./neofetch
        ./rofi
        ./starship.nix
        ./waybar
    ];
}
