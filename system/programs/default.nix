{ config, pkgs, inpurts, ... }:

{
    imports = [
        ./docker.nix
        ./hyprland.nix
        ./others.nix
        ./polkit.nix
        ./sddm.nix
        ./swaylock.nix
        ./syncthing.nix
        ./vm.nix
    ];
}
