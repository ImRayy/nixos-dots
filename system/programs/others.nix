{ config, pkgs, ... }:

{
    services = {
        adb.enable = true;
        flatpak.enable = true;
    };
}
