{pkgs, ...}: {
  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = _: true;
  };

  home.packages = with pkgs; [
    brave
    cryptomator
    obsidian
    smile
    tauon
    telegram-desktop
    keepassxc

    # Terminal Apps
    age
    bat
    bottom
    cliphist
    exiftool
    imagemagick
    jq
    lazydocker
    lazygit
    rclone
    tldr
    yt-dlp
    wiremix

    # GUI Apps
    nautilus
    pavucontrol
    qbittorrent

    # Terminal Stuff
    libwebp
    lsof
    ncdu
    neofetch
    libnotify
    tokei
    pv
    uv

    # Programming stuff
    docker-compose
    cargo
    git-lfs
    go
    gum
    openssl
    postgresql
    python3
    sqlite
  ];
}
