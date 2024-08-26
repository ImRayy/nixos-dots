{ lib, config, systemConfig, homeConfig, ... }:

let
    enabled =  homeConfig.notificationDaemon == "dunst";
in
{
    services.dunst = {
        enable = enabled;
        settings = with config.lib.stylix.colors; {
            global = {
                # The geometry of the notification window.
                width = 340;
                height = 120;
                origin = "right";
                offset = "10x10";

                indicate_hidden = false;

                # Transparency [0-100]
                transparency = 0;

                # You want a Gap?
                separator_height = 1;

                # Notification box padding
                padding = 8;
                horizontal_padding = 8;

                # Frame
                frame_width = 3;

                # Colors;
                separator_color = "auto";
                sort = "yes";
                idle_threshold = 120;

                # Text 
                font = "CommitMono Nerd Font 10.5";
                line_height = 4;

                # Markup is allowed
                markup = "full";
                alignment = "center";
                show_age_threshold = -1;
                word_wrap = true;
                ellipsize = "middle";
                ignore_newline = false;
                stack_duplicates = true;
                hide_duplicate_count = true;
                show_indicators = true;

                # Icons
                icon_position = "left";
                max_icon_size = 80;

                # History
                sticky_history = "yes";
                history_length = 20;

                # Misc/Advanced
                title = "Dunst";
                class = "Dunst";

            };

            urgency_low = {
                timeout = 5;
                background = "#${base00}";
                foreground= "#${base05}";
                frame_color = "#${base0B}";
            };

            urgency_normal = {
                timeout = 5;
                background = "#${base00}";
                foreground = "#${base05}";
                frame_color = "#${base07}";
                highlight = "#${base07}";
            };

            urgency_critical = {
                timeout = 0;
                background = "#${base00}";
                foreground ="#${base05}";
                frame_color = "#${base08}";
            };
        };
    };
}
