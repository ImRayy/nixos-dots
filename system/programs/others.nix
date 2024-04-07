{ config, pkgs, ... }:

{
    services.flatpak.enable = true;
    services.ollama = {
        enable = true;
        package = pkgs.ollama;
    };
    programs.adb.enable = true;
}
