{
  flake.modules.homeManager.hyprland = {
    wayland.windowManager.hyprland.settings = {
      env = [
        "DESKTOP_SESSION,hyprland"
        "OZONE_PLATFORM,wayland"
        "ELECTRON_OZONE_PLATFORM_HINT,auto"
        "XDG_SESSION_DESKTOP,hyprland"

        # Mozilla
        "MOZ_DISABLE_RDD_SANDBOX,1"
        "MOZ_ENABLE_WAYLAND,1"

        # MOUSE CURSOR
        "XCURSOR_THEME,Bibata-Modern-Ice"
        "XCURSOR_SIZE,24"

        # QT
        "QT_QPA_PLATFORM,wayland"
        "QT_QPA_PLATFORMTHEME,gtk3"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "QT_QPA_PLATFORMTHEME_QT6,gtk3"

        # 🖕 NVIDIA 🖕
        "WLR_NO_HARDWARE_CURSORS,1"
        "LIBVA_DRIVER_NAME,nvidia"
        "XDG_SESSION_TYPE,wayland"
        # "GBM_BACKEND,nvidia-drm" # firefox crash
        "__GLX_VENDOR_LIBRARY_NAME,nvidia"
      ];
    };
  };
}
