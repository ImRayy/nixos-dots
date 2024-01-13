{ config, pkgs, inpurts, ... }:

{
    imports = [
        ./adb.nix
        ./flatpak.nix
        ./hyprland.nix
        ./polkit.nix
        ./sddm.nix
        ./syncthing.nix
        ./vm.nix
    ];
}
