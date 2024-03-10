{ config, pkgs, ... }:

{
    imports = [
        ./env.nix
        ./programs
        ./programs.nix
        ./scripts.nix
        ./stylix
    ];
}
