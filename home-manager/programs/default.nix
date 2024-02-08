{ config, pkgs, ... }:

{
    imports = [
        ./fish
        ./gtk.nix
        ./hypr
        ./kitty.nix
        ./lf
        ./mako.nix
        ./neofetch
        ./rofi
        ./starship.nix
        ./waybar
    ];
}
