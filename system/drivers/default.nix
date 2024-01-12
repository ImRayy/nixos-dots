{ config, pkgs, ... }:

{
    imports = [
        ./audio.nix
        ./nvidia.nix
        ./printer.nix
    ];
}
