{inputs, ...}: {
  flake.modules.nixos.everfrostSystemPackages = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      inputs.helium.packages.${pkgs.stdenv.hostPlatform.system}.default

      # Core & System
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
      imagemagick
      jq
      ncdu
      tldr
      uv
      pv
      cloudflare-warp
      television
      android-tools

      # GUI Apps
      loupe
      zed-editor
      cryptomator
      keepassxc
      nautilus
      obsidian
      qbittorrent

      # Media & Audio
      ffmpeg
      yt-dlp

      # Networking & Transfer
      curl
      rclone
      wget

      # Hardware & Drivers
      libnotify
      libwebp
      usb-modeswitch
      usbutils

      # Development
      cargo
      go
      lazydocker
      lazygit
      postgresql
      python3
      sqlite
      bun
      pipx
      volta
    ];
  };
}
