{
  username = "ray";
  systemConfig = {
    hostname = "EverFrost";
    locale = "en_IN";
    timezone = "Asia/Kolkata";
  };

  userConfig = {
    theme = "gruvbox"; # [catppuccin-mocha|gruvbox|rosepine]
    notificationDaemon = "quickshell"; # [dunst|quickshell]
    terminal = "foot"; # [foot|kitty|ghostty];
    defaultHomeShell = "fish"; # [fish|zsh|nu]
    virtual-machine.enable = false; # Kvm/Virt-manager
    syncthing.enable = true;
    docker.enable = true;
    printing.enable = true;
    ollama.enable = false;
    gaming.enable = true;

    # Window Manager
    windowManager = "hyprland"; # niri | hyprland

    # Default Apps
    mime = {
      browser = "brave.desktop"; # ["zen-beta.desktop" | "brave.desktop"];
      image = "org.gnome.Loupe.desktop";
    };
  };
}
