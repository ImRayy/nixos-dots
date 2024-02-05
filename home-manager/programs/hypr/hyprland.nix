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
                gaps_in = 3;
                gaps_out = 6;
                border_size = 3;
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
            env = [
                "WLR_NO_HARDWARE_CURSORS,1"
                "LIBVA_DRIVER_NAME,nvidia"
                "XDG_SESSION_TYPE,wayland"
                "GBM_BACKEND,nvidia-drm"
                "__GLX_VENDOR_LIBRARY_NAME,nvidia"
                "MOZ_DISABLE_RDD_SANDBOX,1"
                "MOZ_ENABLE_WAYLAND,1"
                "OZONE_PLATFORM,wayland"
            ];
        };

    };
}
