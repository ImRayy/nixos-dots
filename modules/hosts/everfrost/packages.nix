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
      ncdu
      tldr
      uv
      pv
      cloudflare-warp
      android-tools
      scrcpy
      zathura

      # GUI Apps
      loupe
      cryptomator
      nautilus
      qbittorrent

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

      # Spell Dictionaries
      hunspellDicts.en_US
    ];
  };
}
