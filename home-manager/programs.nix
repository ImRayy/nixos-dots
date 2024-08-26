{ config, lib, pkgs, homeConfig, ... }:

{
    nixpkgs.config = {
        allowUnfree = true;
        allowUnfreePredicate = _: true;
    };

    home.packages = with pkgs; [
        # GUI Apps
        gimp
        keepassxc
        neovide
        obs-studio
        obsidian
        qbittorrent-qt5
        simple-scan
        system-config-printer
    	nautilus
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
        neofetch
        nix-prefetch-git
        pv
        ripgrep
        scrcpy
        starship
        tldr
        trash-cli
        yazi

        # firebase-tools
        git-lfs
        go
        gum
        nixfmt-rfc-style
        sassc

        # QT
        # libsForQt5.qt5ct
        # libsForQt5.qtstyleplugin-kvantum
        #
        # # Misc
        # libdbusmenu-gtk3
    ];
}
