{ config, pkgs, homeConfig, ... }:
{
    services.mako = {
        enable = if homeConfig.notificationDaemon == "waybar" then true else false; 
        package = pkgs.mako;
        width = 400;
        height = 120;
        icons = true;
        padding = "18";
        borderSize =2;
        borderRadius = 6;
        defaultTimeout = 5000;
    };
}
