{ config, pkgs, ... }:

{
    imports = [
        ./programs.nix
        ./programs
        ./stylix
    ];
}
