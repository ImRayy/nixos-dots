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
            general = with config.lib.stylix.colors; {
                gaps_in = 3;
                gaps_out = 6;
                border_size = 3;
                "col.active_border" = "0xff${base07}";
                "col.inactive_border" = "0x33${base00}";
                layout = "dwindle";
            };
            decoration = {
                blur = {
                    enabled = true;
                    size = 8;
                    passes = 2;
                    new_optimizations = true;
                    xray = true;
                    ignore_opacity = true;
                };
                rounding = 8;
                drop_shadow = "no";
                shadow_range = 10;
                shadow_render_power = 5;
            };
            animations = {
                enabled = "yes";
                bezier = "quart, 0.25, 1, 0.5, 1";
                animation = [
                    "windows, 1, 6, quart, popin"
                    "windowsOut, 1, 7, quart"
                    "border, 1, 6, default"
                    "borderangle, 1, 6, quart"
                    "fade, 1, 6, quart"
                    "workspaces, 1, 6, quart"
                    "layers, 1, 6, quart, slide"
                ];
            };
            dwindle = {
                no_gaps_when_only = false;
                pseudotile = "yes";
                preserve_split = "yes";
            };
            env = [
                "CLUTTER_BACKEND,wayland"
                "XDG_SESSION_TYPE,wayland"
                "XDG_CURRENT_DESKTOP,Hyprland"
                "GDK_BACKEND,wayland,x11"
                "QT_AUTO_SCREEN_SCALE_FACTOR,1"
                "QT_QPA_PLATFORM,wayland;xcb"
                "QT_SCALE_FACTOR,1"
                "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
                "MOZ_DISABLE_RDD_SANDBOX,1"
                "MOZ_ENABLE_WAYLAND,1"
                # "OZONE_PLATFORM,wayland"
                "XCURSOR_THEME,Bibata-Modern-Ice"
                "XCURSOR_SIZE,24"

                # 🖕 NVIDIA 🖕
                "WLR_NO_HARDWARE_CURSORS,1"
                "LIBVA_DRIVER_NAME,nvidia"
                "GBM_BACKEND,nvidia-drm"
                "__GLX_VENDOR_LIBRARY_NAME,nvidia"
            ];
            layerrule = [
                "animation default,selection"
            ];
        };

    };
}
