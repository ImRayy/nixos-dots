{ config, pkgs, ... }:

{
    imports = [
        ./gtk.nix
        ./hypr
        ./kitty.nix
        ./lf
        ./rofi
        ./waybar
    ];
}
