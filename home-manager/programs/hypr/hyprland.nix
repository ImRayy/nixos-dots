{config, ...}: {
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "quickshell &"
      "wl-paste --type text --watch cliphist store &"
      "wl-paste --type image --watch cliphist store &"
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
        size = 6;
        passes = 2;
        new_optimizations = true;
        noise = 0.1;
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
        "quart, 0.25, 1, 0.5, 1"
        "specialWorkSwitch, 0.05, 0.7, 0.1, 1"
        "standard, 0.2, 0, 0, 1"
        "winIn, 0.1, 1.1, 0.1, 1.1"
        "winOut, 0.3, -0.3, 0, 1"
        "wind, 0.05, 0.9, 0.1, 1.05"
      ];

      animation = [
        "border, 1, 6, standard"
        "borderangle, 1, 6, quart"
        "fade, 1, 6, quart"
        "fadeDim, 1, 6, standard"
        "layers, 1, 6, quart, slide"
        "specialWorkspace, 1, 6, specialWorkSwitch, slidefadevert 15%"
        "windowsIn, 1, 6, winIn, slide"
        "windowsMove, 1, 5, standard, slide"
        "windowsOut, 1, 5, winOut, slide"
        "workspaces, 1, 6, standard"
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
      "XDG_SESSION_DESKTOP,hyprland"

      # Mozilla
      "MOZ_DISABLE_RDD_SANDBOX,1"
      "MOZ_ENABLE_WAYLAND,1"

      # MOUSE CURSOR
      "XCURSOR_THEME,Bibata-Modern-Ice"
      "XCURSOR_SIZE,24"

      # QT
      "QT_QPA_PLATFORM,wayland"
      "QT_QPA_PLATFORMTHEME, gtk3"
      "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"

      # 🖕 NVIDIA 🖕
      "WLR_NO_HARDWARE_CURSORS,1"
      "LIBVA_DRIVER_NAME,nvidia"
      "XDG_SESSION_TYPE,wayland"
      # "GBM_BACKEND,nvidia-drm" # firefox crash
      "__GLX_VENDOR_LIBRARY_NAME,nvidia"
    ];

    windowrule = [
      # Disables weird blur border
      "noblur, title:^()$, class:^()$"

      # Emoji Picker
      "float, initialClass:it.mijorus.smile"
      "rounding 6, class:it.mijorus.smile"
      "animation popin, class:it.mijorus.smile"

      # KeePassXC
      "size 800 540,class:org.keepassxc.KeePassXC"
      "float, class:org.keepassxc.KeePassXC"
      "rounding 6, class:org.keepassxc.KeePassXC"

      # Terminal Musicplayer
      "size 800 540, initialTitle:^(music-player)$"
      "center, initialTitle:^(music-player)$"
      "float, initialTitle:^(music-player)$"

      # File Picker
      "animation popin, title:Save Image"
      "animation popin, title:Save As"
      "animation popin, title:File Upload"
    ];

    layerrule = [
      "animation default,selection"
      "animation popin 85%, (quickshell::launcher)(.*)"
      "animation popin 85%, quickshell::powermenu"
      "animation slide bottom, quickshell::alert-dialog"
      "animation slide bottom, quickshell::wallpapers"
    ];
  };
}
