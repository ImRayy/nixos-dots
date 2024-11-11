{pkgs, ...}: {
  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = _: true;
  };

  home.packages = with pkgs; [
    # GUI Apps
    gimp
    keepassxc
    nautilus
    neovide
    obs-studio
    obsidian
    pavucontrol
    qbittorrent
    simple-scan
    system-config-printer
    eog

    # Terminal Stuff
    jq
    bat
    bottom
    cliphist
    exiftool
    eza
    fd
    ffmpeg
    gnupg
    imagemagick
    lazygit
    libnotify
    libwebp
    lsof
    ncdu
    neofetch
    nix-prefetch-git
    pv
    ripgrep
    starship
    tldr
    trash-cli

    # Programming stuff
    cargo
    git-lfs
    go
    gum
    openssl
    postgresql_16
    python3
    sqlite
    volta

    # QT
    # libsForQt5.qt5ct
    # libsForQt5.qtstyleplugin-kvantum
    #
    # # Misc
    # libdbusmenu-gtk3
  ];
}
