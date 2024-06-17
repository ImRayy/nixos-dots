{ config, pkgs, ... }:

{
    imports = [
        ./ags.nix
        ./dunst.nix
        ./fish
        ./fzf.nix
        ./gtk.nix
        ./hypr
        ./kitty.nix
        ./lf
        ./mako.nix
        ./misc.nix
        ./mpv.nix
        ./neofetch
        ./qtile.nix
        ./rofi
        ./starship.nix
        ./waybar
    ];
}
