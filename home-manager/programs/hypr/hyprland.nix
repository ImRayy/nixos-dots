{config, ...}: {
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "uwsm app -- ags &"
      "uwsm app -- swww-daemon &"
      "uwsm app -- wl-paste --type text --watch cliphist store &"
      "uwsm app -- wl-paste --type image --watch cliphist store &"
    ];

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
      "col.active_border" = "0xff${base0B}";
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

      shadow = {
        enabled = true;
        range = 8;
        render_power = 2;
      };

      rounding = 0;
    };

    animations = {
      enabled = "yes";
      bezier = [
        "wind, 0.05, 0.9, 0.1, 1.05"
        "winIn, 0.1, 1.1, 0.1, 1.1"
        "winOut, 0.3, -0.3, 0, 1"
        "liner, 1, 1, 1, 1"
        "quart, 0.25, 1, 0.5, 1"
      ];

      animation = [
        "windowsIn, 1, 6, winIn, slide"
        "windowsOut, 1, 5, winOut, slide"
        "windowsMove, 1, 5, wind, slide"
        "border, 1, 6, default"
        "borderangle, 1, 6, quart"
        "fade, 1, 6, quart"
        "workspaces, 1, 6, quart"
        "layers, 1, 6, quart, slide"
      ];
    };

    cursor = {
      no_hardware_cursors = true;
      persistent_warps = true;
    };

    dwindle = {
      pseudotile = "yes";
      preserve_split = "yes";
    };

    misc = {
      disable_hyprland_qtutils_check = true;
    };

    env = [
      "DESKTOP_SESSION,hyprland"
      "OZONE_PLATFORM,wayland"
      "ELECTRON_OZONE_PLATFORM_HINT,wayland"

      # Mozilla
      "MOZ_DISABLE_RDD_SANDBOX,1"
      "MOZ_ENABLE_WAYLAND,1"

      # MOUSE CURSOR
      "XCURSOR_THEME,Bibata-Modern-Ice"
      "XCURSOR_SIZE,24"

      # 🖕 NVIDIA 🖕
      "WLR_NO_HARDWARE_CURSORS,1"
      "LIBVA_DRIVER_NAME,nvidia"
      "XDG_SESSION_TYPE,wayland"
      # "GBM_BACKEND,nvidia-drm" # firefox crash
      "__GLX_VENDOR_LIBRARY_NAME,nvidia"
    ];
  };
}
