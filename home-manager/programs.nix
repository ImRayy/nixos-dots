{ config, pkgs, ...}:

{
    nixpkgs.config = {
        allowUnfree = true;
        allowUnfreePredicate = _: true;
    };

    nixpkgs.config.permittedInsecurePackages = [ "electron-25.9.0" ];

    home.packages = with pkgs; [

        # GUI Apps
        easyeffects
        firefox
        gimp
        gnome.eog
        keepassxc
        lollypop
        megasync
        mpv
        obs-studio
        obsidian
        qbittorrent-qt5
        simple-scan
        spotify
        steam-run
        telegram-desktop
        vlc
        vscode
        bemenu

        # Terminal Stuff
        appimage-run
        bat
        bottom
        cava
        czkawka
        ffmpeg
        ffmpeg
        git-lfs
        gnupg
        gum
        imagemagick
        lazygit
        lsd
        neofetch
        nix-prefetch-git
        ripgrep
        starship
        stow
        tldr
        trash-cli
        tree
        wlsunset

        # Programming utilities
        bun
        cargo
        corepack_21
        jdk
        nodejs_20
        pipx
        python311Packages.pip
        python39

        # QT
        libsForQt5.qt5ct
        libsForQt5.qtstyleplugin-kvantum
    ];
}
