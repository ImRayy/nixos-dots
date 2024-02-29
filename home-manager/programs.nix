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
        bemenu
        cinnamon.nemo
        easyeffects
        firefox
        gimp
        gnome.eog
        keepassxc
        lollypop
        megasync
        mpv
        neovide
        nwg-look
        obs-studio
        obsidian
        qbittorrent-qt5
        simple-scan
        spotify
        steam-run
        telegram-desktop
        vlc
        vscode

        # Terminal Stuff
        appimage-run
        atuin
        bat
        bottom
        cava
        cliphist
        ffmpeg
        git-lfs
        gnupg
        gum
        hyprpicker 
        imagemagick
        lazygit
        libnotify
        libwebp
        lsd
        neofetch
        nix-prefetch-git
        ripgrep
        starship
        stow
        tldr
        trash-cli
        tree
        wl-clipboard
        wlsunset

        # Programming utilities
        bun
        cargo
        corepack_21
        jdk
        nixfmt
        nodejs_20
        pipx
        python311Packages.pip
        python39
        sassc

        # QT
        libsForQt5.qt5ct
        libsForQt5.qtstyleplugin-kvantum

        # Misc
        libdbusmenu-gtk3
    ];
}
