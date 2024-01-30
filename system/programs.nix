{ config, pkgs, inputs, system, ...}:

{

  environment.systemPackages = with pkgs; [

      # Core Packages
      clang
      curl
      file
      gcc
      git
      killall
      neovim
      pamixer
      unzip
      usbutils
      wget
      zip
      inotify-tools

      # Standard Packages 
      sane-backends
      usb-modeswitch

      # CLI Packages
      trash-cli
      playerctl

      # Hyprland/Wayland Stuff
      xdg-desktop-portal-hyprland
      cliphist
      eww-wayland
      grim
      rofi-wayland
      rofi-emoji
      slurp
      swaynotificationcenter
      swayosd
      swww
      waybar
      wl-clipboard

      # GTK
      nwg-look

      # QT
      libsForQt5.qt5.qtquickcontrols2
      libsForQt5.qt5.qtgraphicaleffects

      # Misc
      cinnamon.nemo
      lsd
      starship
      nodejs_20

  ];

  fonts = {
      fontconfig.enable = true;
      packages = with pkgs;[
          cantarell-fonts
         (nerdfonts.override { fonts = ["CommitMono"]; })
      ];
  };

}
