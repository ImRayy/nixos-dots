{ config, pkgs, inpurts, ... }:

{
    imports = [
        ./adb.nix
        ./flatpak.nix
        ./hyprland.nix
        ./sddm.nix
        ./syncthing.nix
        ./vm.nix
    ];
}
