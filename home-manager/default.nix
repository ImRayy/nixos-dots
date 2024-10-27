{ config, pkgs, ... }:

{
  imports = [
    ./env.nix
    ./programs
    ./programs.nix
    ./scripts
    ./stylix
  ];
}
