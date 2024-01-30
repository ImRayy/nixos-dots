{ config, pkgs, stylix, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should manage.
  home.username = "ray";
  home.homeDirectory = "/home/ray";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.
  # The home.packages option allows you to install Nix packages into your
  # environment.

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = _: true;
  };

  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];

  home.packages = with pkgs; [
    # GUI Apps
    firefox
    gimp
    simple-scan
    keepassxc
    mpv
    vlc
    spotify
    telegram-desktop
    vscode
    obs-studio
    easyeffects
    lollypop
    steam-run
    obsidian
    kitty
    megasync
    qbittorrent-qt5

    # Terminal Stuff
    appimage-run
    bat
    bottom
    cava
    czkawka
    ffmpeg
    ffmpeg
    gnupg
    gum
    imagemagick
    lazygit
    lf
    lsd
    neofetch
    pistol
    ripgrep
    stow
    tldr
    trash-cli

    # Clipboard

    # Theme Stuff
    starship

 #   # GNOME Stuff
    gnome.eog
 #   gnome-extension-manager
 #   gnome.gnome-software
 #   gnome.gnome-tweaks
 #   gnome.nautilus
 #   gnomeExtensions.gsconnect

 #   # Programming Languages
    cargo
    jdk
    nodejs_20
    pipx
    python311Packages.pip
    python39

    # Programming utilities
    bun
    corepack_21

    # QT
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct

  ];
  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Mocha-Standard-Lavender-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "lavender" ];
        size = "standard";
        tweaks = [ "rimless" ];
        variant = "mocha";
      };
    };
    cursorTheme = {
        name = "Bibata-Modern-Ice";
        package = pkgs.bibata-cursors;
    };
    iconTheme = {
        name = "Tela-circle-dark";
        package = pkgs.tela-circle-icon-theme;
    };
  };

  qt = {
      enable = true;
      platformTheme = "gtk";

  };

  programs.home-manager.enable = true;

  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
        autoconnect = ["qemu:///system"];
        uris = ["qemu:///system"];
    };
  };

}
