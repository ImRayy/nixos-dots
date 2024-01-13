{ config, pkgs, ... }:

{
    services.flatpak.enable = true;
    programs.adb.enable = true;
}
