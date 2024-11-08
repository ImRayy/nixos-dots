{ pkgs, ... }:

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
    playerctl

    # QT
    libsForQt5.qt5.qtquickcontrols2
    libsForQt5.qt5.qtgraphicaleffects
  ];

  programs.appimage = {
    enable = true;
    binfmt = true;
  };

  fonts = {
    fontDir.enable = true;
    fontconfig.enable = true;
    packages = with pkgs; [
      cantarell-fonts
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-extra
      dejavu_fonts
      liberation_ttf
      (nerdfonts.override { fonts = [ "CommitMono" ]; })
    ];
  };

  services.xserver.excludePackages = [ pkgs.xterm ];
}
