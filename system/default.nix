{ config, pkgs, inputs, system, ... }:

{
    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    imports = [
        ./boot.nix
        ./drivers
        ./network
        ./programs
        ./programs.nix
    ];
}
