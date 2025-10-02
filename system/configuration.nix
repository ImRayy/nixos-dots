{
  pkgs,
  username,
  systemConfig,
  userConfig,
  ...
}: {
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

  # WindowManager
  qtile.enable = userConfig.wm.qtile.enable;
  hyprland.enable = userConfig.wm.hyprland.enable;

  # Virtual Machine
  vm.enable = userConfig.virtual-machine.enable;

  # Services
  syncthing.enable = true;

  services = {
    xserver = {
      enable = true;
      excludePackages = with pkgs; [nano xterm];
    };
  };

  # Enable networking
  networking.networkmanager.enable = true;
  networking.hostName = systemConfig.hostname;

  # To support mtp/android file transfer
  services.ipp-usb.enable = true;
  services.gvfs.enable = true;

  # nix-ld: run unpatched dynamic binaries
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [stdenv.cc.cc.lib];
  };

  # Docker & Podman
  virtualisation = {
    docker = {
      enable = true;
      enableOnBoot = true;
      rootless = {
        enable = true;
        setSocketVariable = true;
      };
      autoPrune.enable = true;
    };
    podman.enable = true;
  };

  # Enable .appimage
  programs.appimage = {
    enable = true;
    binfmt = true;
  };

  # Enable Fish
  programs.fish.enable = true;

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
    shell = pkgs.fish;
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
