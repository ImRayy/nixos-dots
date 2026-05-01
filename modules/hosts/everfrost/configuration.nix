{self, ...}: {
  flake.modules.nixos.everfrostConfiguration = {
    pkgs,
    config,
    ...
  }: let
    modules = [
      "desktop"
      "docker"
      "fish"
      "gaming"
      "gtk"
      # "hyprland"
      "niri"
      "kdeconnect"
      "lazygit"
      "mpv"
      "neofetch"
      "scripts"
      "neovim"
      "obs-studio"
      "pass"
      "printer"
      "quickshell"
      "shell-extras"
      "starship"
      "syncthing"
      "terminal"
      "theme"
      "yazi"
    ];
  in {
    nix.settings.trusted-users = [config.preferences.username];
    nix.settings.warn-dirty = false;
    nixpkgs.config.allowUnfree = true;

    imports =
      [
        self.modules.nixos.everfrostHardware
        self.modules.nixos.everfrostNvidia
        self.modules.nixos.everfrostSystemPackages
        self.modules.nixos.core
      ]
      ++ (self.lib.loadNixosAndHmModuleForUser config.preferences.username modules);

    documentation = {
      enable = false;
      man = {
        enable = false;
        man-db.enable = false;
        mandoc.enable = false;
      };
    };

    # Enable networking
    networking.networkmanager.enable = true;
    networking.hostName = "EverFrost";

    # To support mtp/android file transfer
    services.ipp-usb.enable = true;
    services.gvfs.enable = true;

    # Other services
    services.flatpak.enable = true;
    services.xserver = {
      enable = true;
      excludePackages = with pkgs; [nano xterm];
    };

    # Enable ADB
    programs.adb.enable = true;

    # nix-ld: run unpatched dynamic binaries
    programs.nix-ld = {
      enable = true;
      libraries = with pkgs; [stdenv.cc.cc.lib];
    };

    # Enable .appimage
    programs.appimage = {
      enable = true;
      binfmt = true;
    };

    # Enable Flakes
    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
    ];

    # Current User
    users.users.${config.preferences.username} = {
      isNormalUser = true;
      extraGroups = [
        "networkmanager"
        "wheel"
        "audio"
        "lp"
        "scanner"
        "libvirtd"
        "input"
      ];
    };

    # Enable SSD Trim
    services.fstrim = {
      enable = true;
      interval = "weekly";
    };

    # GNU Privacy Guard
    programs.gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };

    # Enable the OpenSSH daemon.
    services.openssh.enable = true;

    # Enable Tailscale
    services.tailscale.enable = true;

    # Use doas & disable sudo
    security.sudo.enable = false;
    security.doas = {
      enable = true;
      extraRules = [
        {
          users = [config.preferences.username];
          keepEnv = true;
          persist = false;
        }
      ];
    };

    programs.localsend.enable = true;

    # NixOS Version
    # -------------
    system.stateVersion = "25.11";
  };
}
