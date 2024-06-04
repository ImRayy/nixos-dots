{ config, lib, homeConfig, systemConfig, ... }:

let
    wm = systemConfig.windowManager;
    useMako = wm == "all" || wm == "hyprland";
    enabled =  lib.mkIf ( useMako && homeConfig.notificationDaemon == "mako" );
in
enabled {
    services.mako = {
        enable = if homeConfig.notificationDaemon == "waybar" then true else false; 
        width = 400;
        height = 120;
        icons = true;
        padding = "18";
        borderSize =2;
        borderRadius = 6;
        defaultTimeout = 5000;
    };
}
