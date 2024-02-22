{ config, pkgs, ... }:

{
    imports = [
        ./ags.nix
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
