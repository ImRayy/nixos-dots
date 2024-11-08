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
    fontconfig.enable = true;
    packages = with pkgs; [
      cantarell-fonts
      (nerdfonts.override { fonts = [ "CommitMono" ]; })
    ];
  };

}
