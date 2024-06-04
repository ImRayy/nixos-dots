{ config, lib, pkgs, homeConfig, ... }:

{
    nixpkgs.config = {
        allowUnfree = true;
        allowUnfreePredicate = _: true;
    };

    nixpkgs.config.permittedInsecurePackages = [ 
        "electron-25.9.0" 
        /* freeimage-unstable used by megasync */ 
        "freeimage-unstable-2021-11-01"
    ];

    home.packages = with pkgs; [
        # GUI Apps
        gimp
        keepassxc
        libreoffice-fresh
        neovide
        obs-studio
        obsidian
        qbittorrent-qt5
        simple-scan
        spotify
        system-config-printer
        gnome.nautilus
        vscode
        pavucontrol

        # Terminal Stuff
        appimage-run
        bat
        bottom
        fd
        ffmpeg
        gnupg
        imagemagick
        lazygit
        libnotify
        libwebp
        lsd
        lsof
        ncdu
        ncspot
        neofetch
        nix-prefetch-git
        pv
        ripgrep
        scrcpy
        starship
        tldr
        trash-cli
        tree

        # Programming utilities
        bun
        cobra-cli
        corepack_22
        firebase-tools
        git-lfs
        go
        gum
        jdk
        nixfmt-rfc-style
        nodePackages_latest.eas-cli
        nodejs_22
        pipx
        python3
        sassc

        # QT
        libsForQt5.qt5ct
        libsForQt5.qtstyleplugin-kvantum

        # Misc
        libdbusmenu-gtk3
        calibre
    ];
}
