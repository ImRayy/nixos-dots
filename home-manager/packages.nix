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
    vscode

    # Terminal Apps
    age
    bat
    bottom
    cliphist
    exiftool
    eza
    fd
    ffmpeg
    imagemagick
    infisical
    jq
    lazydocker
    lazygit
    mpvpaper
    p7zip
    rclone
    ripgrep
    tldr
    trash-cli
    yt-dlp
    obs-studio
    wiremix

    # GUI Apps
    gimp
    nautilus
    neovide
    pavucontrol
    qbittorrent
    hunspell
    hunspellDicts.uk_UA

    # Terminal Stuff
    libnotify
    libwebp
    lsof
    ncdu
    neofetch
    nix-prefetch-git
    wordnet
    chafa
    cachix
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
