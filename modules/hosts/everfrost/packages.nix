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
      gh

      # TUI
      resterm
      posting
      lazydocker
      lazygit

      # GUI Apps
      loupe
      cryptomator
      nautilus
      qbittorrent
      zed-editor
      obsidian

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

      # Spell Dictionaries
      hunspellDicts.en_US
    ];
  };
}
