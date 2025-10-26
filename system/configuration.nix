{
  pkgs,
  username,
  systemConfig,
  userConfig,
  ...
}: let
  cfg = userConfig;
in {
  nixpkgs.config.allowUnfree = true;

  documentation = {
    enable = false;
    man = {
      enable = false;
      man-db.enable = false;
      mandoc.enable = false;
    };
  };

  imports = [
    (import ./locale.nix {inherit systemConfig;})
    ./boot.nix
    ./drivers
    ./firewall.nix
    ./fonts.nix
    ./gaming.nix
    ./hardware-configuration.nix
    ./packages.nix
    ./programs
    ./wm/hyprland.nix
    ./wm/qtile.nix
  ];

  # Userconfig services
  docker.enable = cfg.docker.enable;
  gaming.enable = cfg.gaming.enable;
  hyprland.enable = cfg.wm.hyprland.enable;
  ollama.enable = cfg.ollama.enable;
  printing.enable = cfg.printing.enable;
  qtile.enable = cfg.wm.qtile.enable;
  syncthing.enable = cfg.syncthing.enable;
  vm.enable = cfg.virtual-machine.enable;

  # Enable networking
  networking.networkmanager.enable = true;
  networking.hostName = systemConfig.hostname;

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

  programs.zsh.enable = true;

  # Enable Flakes
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Current User
  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
      "audio"
      "lp"
      "scanner"
      "libvirtd"
    ];
    shell = pkgs.zsh;
  };

  environment.variables = {
    EDITOR = "nvim";
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

  # NixOS Version
  # -------------
  system.stateVersion = "23.05";
}
