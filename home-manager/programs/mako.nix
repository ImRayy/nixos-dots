{ config, pkgs, ... }:
{
    services.mako = {
        package = pkgs.mako;
        enable = true;
        font = "Cantarell 12";
        width = 400;
        height = 120;
        icons = true;
        padding = "18";
        borderSize =2;
        borderRadius = 6;
        borderColor = "#b4befe";
        backgroundColor = "#1e1e2e";
        textColor = "#cdd6f4";
        defaultTimeout = 5000;
        extraConfig = ''
            [urgency=low]
            border-color=#f2cdcd

            [urgency=normal]
            border-color=#b4befe
            default-timeout=5000

            [urgency=high]
            border-color=#f38ba8
            default-timeout=0
        '';
    };
}
