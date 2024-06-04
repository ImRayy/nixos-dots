{ config, pkgs, inpurts, ... }:

{
    imports = [
        ./docker.nix
        ./hyprland.nix
        ./others.nix
        ./polkit.nix
        ./qtile.nix
        ./sddm.nix
        ./swaylock.nix
        ./syncthing.nix
        ./vm.nix
    ];
}
