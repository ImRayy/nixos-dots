{ config, pkgs, ... }:

{
    imports = [
        ./gtk.nix
        ./waybar
        ./kitty.nix
        ./lf
    ];
}
