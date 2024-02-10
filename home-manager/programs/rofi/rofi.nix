{ config, pkgs, ... }:
{
    xdg.configFile = {
        "rofi/themes/default.rasi".source = ./themes/default.rasi;
        "rofi/themes/powermenu.rasi".source = ./themes/powermenu.rasi;
        "rofi/powermenu.sh".source = ./scripts/powermenu.sh;
        "rofi/style.rasi" = with config.lib.stylix.colors; {
            source = pkgs.writeText "my-css" ''
            * {
                background:     #${base00};
                background-alt: #${base03};
                foreground:     #${base05};
                active:         #${base07};
                selected:       #${base07};
                selected-text:  #${base00};
            }

            /* vim:ft=css
        '';
        };

    };
    programs.rofi = {
        enable = true;
        package = pkgs.rofi-wayland;
        plugins = with pkgs; [ rofi-emoji ];
    };
}
