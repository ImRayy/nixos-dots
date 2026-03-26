{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # Core & System
    cachix
    clang
    file
    gcc
    git
    inotify-tools
    killall
    lsof
    openssl
    unzip
    zip

    # Cli Utilities
    age
    bat
    bottom
    cliphist
    exiftool
    imagemagick
    jq
    ncdu
    neofetch
    pv
    tldr
    tokei
    uv

    # GUI Apps
    brave
    cryptomator
    keepassxc
    keepassxc
    nautilus
    obsidian
    pavucontrol
    qbittorrent
    smile
    telegram-desktop
    wiremix
    discord

    # Media & Audio
    ffmpeg
    pamixer
    playerctl
    tauon
    yt-dlp
    v4l-utils

    # Networking & Transfer
    curl
    nix-prefetch-git
    rclone
    wget

    # Hardware & Drivers
    libnotify
    libwebp
    usb-modeswitch
    usbutils

    # Development
    cargo
    docker-compose
    git-lfs
    go
    gum
    lazydocker
    lazygit
    postgresql
    python3
    sqlite

    # Qt / UI Libs
    qt5.qtquickcontrols2
    qt5.qtgraphicaleffects
  ];
}
