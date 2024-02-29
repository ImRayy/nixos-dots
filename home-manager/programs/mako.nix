{ config, lib, pkgs, homeConfig, ... }:

lib.mkIf (homeConfig.notificationDaemon == "mako") {
    services.mako = {
        enable = true; 
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
