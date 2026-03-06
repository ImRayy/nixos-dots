{
  inputs,
  pkgs,
  config,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    plugins = [
      inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.hyprexpo
    ];
  };

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
      layout = "master";
    };

    plugin = {
      hyprexpo = {
        columns = 2;
        gap_size = 5;
        workspace_method = "center current";
        skip_empty = true;
      };
    };

    master = {
      mfact = 0.50;
      new_on_top = true;
      new_on_active = true;
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
        "snap, 0.15, 1, 0.3, 1"
        "winIn, 0.05, 0.9, 0.15, 1"
        "winOut, 0.2, -0.2, 0, 1"
        "slide, 0.1, 1, 0.2, 1"
        "specialSwitch, 0.1, 0.9, 0.15, 1"
      ];
      animation = [
        "border, 1, 5, snap"
        "borderangle, 1, 5, quart"
        "fade, 1, 5, snap"
        "fadeDim, 1, 5, snap"
        "layers, 1, 5, slide, slide"
        "specialWorkspace, 1, 5, specialSwitch, slidefadevert 10%"
        "windowsIn, 1, 5, winIn, slide"
        "windowsMove, 1, 5, snap, slide"
        "windowsOut, 1, 4, winOut, slide"
        "workspaces, 1, 5, slide, slide"
      ];
    };

    cursor = {
      no_hardware_cursors = false;
      persistent_warps = true;
    };

    dwindle = {
      pseudotile = "yes";
      preserve_split = "yes";
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
      # "noblur, title:^$, class:^$"
      "match:class it.mijorus.smile, float on, rounding 6, animation popin"
      "match:class org.keepassxc.KeePassXC, float on, size 800 600"

      # Music Players
      "match:title Tauon, float on, size 800 600, center on"

      # File Pickers
      "match:title Save Image, size 800 600, animation popin, float on"
      "match:title Save As, size 800 600, animation popin, float on"
      "match:title File Upload, size 800 600, animation popin, float on"
      "match:title Save File, size 800 600, animation popin, float on"
    ];

    layerrule = [
      "match:namespace selection, animation default"
      "match:namespace (quickshell::launcher)(.*), animation popin 85%"
      "match:namespace quickshell::powermenu, animation popin 85%"
      "match:namespace quickshell::alert-dialog, animation slide bottom"
      "match:namespace quickshell::wallpapers, animation slide bottom"
    ];
  };
}
