{ config, lib, pkgs, homeConfig, ...}:

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
        swayimg
        system-config-printer
        gnome.nautilus
        vscode
        pavucontrol

        # Terminal Stuff
        appimage-run
        bat
        bottom
        cliphist
        ffmpeg
        firebase-tools
        git-lfs
        gnupg
        gum
        hyprpicker 
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
        wl-clipboard
        wlsunset

        # Programming utilities
        nodePackages_latest.eas-cli
        bun
        corepack_22
        jdk
        nixfmt-rfc-style
        nodejs_22
        python3
        sassc

        # QT
        libsForQt5.qt5ct
        libsForQt5.qtstyleplugin-kvantum

        # Misc
        libdbusmenu-gtk3
    ];
}
