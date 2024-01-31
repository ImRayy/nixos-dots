{ config, pkgs, ... }:

{
    imports = [
        ./rofi
        ./gtk.nix
        ./kitty.nix
        ./lf
        ./waybar
    ];
}
