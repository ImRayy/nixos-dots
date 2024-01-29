{ config, pkgs, inpurts, ... }:

{
    imports = [
        ./hyprland.nix
        ./others.nix
        ./polkit.nix
        ./sddm.nix
        ./swaylock.nix
        ./syncthing.nix
        ./vm.nix
    ];
}
