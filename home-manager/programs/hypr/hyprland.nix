{ config, pkgs, ... }:

{
    wayland.windowManager.hyprland = {
        settings = {
            "$mod" = "SUPER";

            monitor = ",preferred,auto,1";
            input = {
                kb_layout = "us";
                follow_mouse = 1;
            };
            general = {
                gaps_in = 4;
                gaps_out = 8;
                border_size = 3;
                "col.active_border" = "rgb(b4befe)";
                "col.inactive_border" = "rgb(45475a)";
                layout = "dwindle";
            };
            decoration = {
                blur = {
                    enabled = true;
                    size = 6;
                    passes = 2;
                    new_optimizations = true;
                    xray = true;
                    ignore_opacity = true;
                };
                rounding = 6;
                drop_shadow = "no";
                shadow_range = 10;
                shadow_render_power = 5;
                "col.shadow" = "rgb(000000)";
            };
            animations = {
                enabled = "yes";
                bezier = "quart, 0.25, 1, 0.5, 1";


                animation = [
                    "windows, 1, 6, quart, slide"
                    "border, 1, 6, quart"
                    "borderangle, 1, 6, quart"
                    "fade, 1, 6, quart"
                    "workspaces, 1, 6, default, slidefade 20%"
                ];
            };
            dwindle = {
                no_gaps_when_only = false;
                pseudotile = "yes";
                preserve_split = "yes";
            };
            master = {
                new_is_master = true;
            };
        };

    };
}