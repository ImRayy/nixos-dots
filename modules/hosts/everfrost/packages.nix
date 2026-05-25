{inputs, ...}: {
  flake.modules.nixos.everfrostSystemPackages = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      inputs.helium.packages.${pkgs.stdenv.hostPlatform.system}.default

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
      pv

      # GUI Apps
      loupe
      zed-editor
      cryptomator
      keepassxc
      nautilus
      obsidian
      qbittorrent
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
      lazydocker
      lazygit
      postgresql
      python3
      sqlite
    ];
  };
}
