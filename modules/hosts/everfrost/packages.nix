{
  flake.modules.nixos.everfrostSystemPackages = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      # Core & System
      gcc
      git
      inotify-tools
      lsof
      openssl
      unzip
      zip

      # Cli Utilities
      age
      bat
      bottom
      exiftool
      imagemagick
      jq
      ncdu
      tldr
      uv
      gpu-screen-recorder

      # GUI Apps
      brave
      cryptomator
      keepassxc
      nautilus
      obsidian
      qbittorrent
      telegram-desktop
      wiremix

      # Media & Audio
      ffmpeg
      pamixer
      playerctl
      yt-dlp

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
    ];
  };
}
