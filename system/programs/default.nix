{ config, pkgs, inpurts, ... }:

{
    imports = [
        ./hyprland.nix
        ./polkit.nix
        ./sddm.nix
        ./syncthing.nix
        ./vm.nix
        ./others.nix
    ];
}
