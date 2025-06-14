{
  pkgs,
  unstablePkgs,
  inputs,
  ...
}: {
  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = _: true;
  };

  home.packages =
    (with unstablePkgs; [
      inputs.zen-browser.packages."${system}".default
      cryptomator
      ente-auth
      notesnook
      obsidian
      smile
      tauon
      telegram-desktop
      keepassxc

      # Terminal Apps
      age
    ])
    ++ (with pkgs; [
      # GUI Apps
      gimp
      nautilus
      neovide
      obs-studio
      pavucontrol
      qbittorrent
      hunspell
      hunspellDicts.uk_UA

      # Terminal Stuff
      jq
      bat
      bottom
      cliphist
      exiftool
      eza
      fd
      ffmpeg
      gnupg
      imagemagick
      lazygit
      lazydocker
      libnotify
      libwebp
      lsof
      ncdu
      neofetch
      nix-prefetch-git
      pv
      ripgrep
      tldr
      trash-cli
      p7zip
      rclone
      mpvpaper
      yt-dlp
      docker-compose
      uv
      wordnet
      chafa
      cachix
      tokei

      # Programming stuff
      cargo
      git-lfs
      go
      gum
      openssl
      postgresql_16
      python3
      sqlite
    ]);
}
