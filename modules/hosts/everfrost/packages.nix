{
  flake.modules.nixos.everfrostSystemPackages = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
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
      tldr
      uv
      pv
      cloudflare-warp
      android-tools
      scrcpy
      zathura
      zed-editor
      doppler

      # TUI
      posting
      lazydocker

      # GUI Apps
      loupe
      cryptomator
      nautilus
      qbittorrent
      obsidian
      proton-pass

      # Media & Audio
      ffmpeg

      # Networking & Transfer
      curl
      wget

      # Hardware & Drivers
      libnotify
      libwebp
      usb-modeswitch
      usbutils

      # Development
      bun
      cargo
      go
      nodejs_22
      pipx
      pnpm
      postgresql
      python3
      sqlite
    ];
  };
}
