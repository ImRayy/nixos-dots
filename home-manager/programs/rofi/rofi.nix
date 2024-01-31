{ config, pkgs, ... }:
{

    xdg.configFile = {
        "rofi/themes/default.rasi".source = ./themes/default.rasi;
        "rofi/themes/powermenu.rasi".source = ./themes/powermenu.rasi;
        "rofi/powermenu.sh".source = ./scripts/powermenu.sh;
        "rofi/style.rasi".source = pkgs.writeText "my-css" ''
            * {
                background:     #1e1e2e;
                background-alt: #313244;
                foreground:     #7f849c;
                active:         #313244;
                selected:       #b4befe;
                selected-text:  #1e1e2e;
            }

            /* vim:ft=css
        '';

    };

    programs.rofi = {
        enable = true;
        package = pkgs.rofi-wayland;
        plugins = with pkgs; [ rofi-emoji ];
    };
}
