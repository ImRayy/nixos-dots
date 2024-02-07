{ config, pkgs, ... }:

{
    imports = [
        ./programs
        ./programs.nix
        ./scripts.nix
        ./stylix
    ];
}
