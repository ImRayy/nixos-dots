{
  username = "ray";
  systemConfig = {
    hostname = "EverFrost";
    locale = "en_IN";
    timezone = "Asia/Kolkata";
  };

  userConfig = rec {
    theme = "gruvbox"; # [catppuccin-mocha|gruvbox|rosepine]
    notificationDaemon = "ags"; # [dunst|ags]
    virtual-mechine.enable = false; # Kvm/Virt-manager
    wm = {
      qtile.enable = false;
      hyprland.enable = true;
    };
    terminal = {
      # Kitty works on both wayland & x11, but foot is wayland only
      kitty.enable = true;
      foot.enable = wm.hyprland.enable;
    };
  };
}
