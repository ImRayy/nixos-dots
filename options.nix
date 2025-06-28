{
  username = "ray";
  systemConfig = {
    hostname = "EverFrost";
    locale = "en_IN";
    timezone = "Asia/Kolkata";
  };

  userConfig = {
    theme = "gruvbox"; # [catppuccin-mocha|gruvbox|rosepine]
    notificationDaemon = "ags"; # [dunst|ags]
    virtual-machine.enable = false; # Kvm/Virt-manager
    wm = {
      qtile.enable = false;
      hyprland.enable = true;
    };
  };
}
