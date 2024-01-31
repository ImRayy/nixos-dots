{ config, pkgs, ... }:

{
    imports = [
        ./gtk.nix
        ./waybar
    ];
}
