{ config, pkgs, inputs, system, ...}:

{

  # Unstable Channel
  # nixpkgs.config = { packageOverrides = pkgs: {
  #     unstable = import unstableTarball {
  #       config = config.nixpkgs.config;
  #     };
  #   };
  # };
  
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

      # Standard Packages 
      sane-backends
      usb-modeswitch
    

      # Hyprland/Wayland Stuff
      xdg-desktop-portal-hyprland
      cliphist
      eww-wayland
      grim
      rofi-wayland
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
      gnome.nautilus
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
