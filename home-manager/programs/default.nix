{ config, pkgs, ... }:

{
    imports = [
        ./gtk.nix
        ./hypr
        ./kitty.nix
        ./lf
        ./mako.nix
        ./neofetch
        ./rofi
        ./waybar
    ];
}
