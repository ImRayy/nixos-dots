{ config, pkgs, ... }:
{
    services.mako = {
        package = pkgs.mako;
        enable = true;
        width = 400;
        height = 120;
        icons = true;
        padding = "18";
        borderSize =2;
        borderRadius = 6;
        defaultTimeout = 5000;
    };
}
