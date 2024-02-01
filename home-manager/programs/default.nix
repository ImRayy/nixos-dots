{ config, pkgs, ... }:

{
    imports = [
        ./gtk.nix
        ./hypr
        ./kitty.nix
        ./lf
        ./mako.nix
        ./rofi
        ./waybar
    ];
}
