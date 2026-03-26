{
  pkgs,
  username,
  systemConfig,
  userConfig,
  inputs,
  ...
}: let
  config = userConfig;
in {
  nix.settings.trusted-users = [username];
  nix.settings.warn-dirty = false;
  nixpkgs.config.allowUnfree = true;

  home-manager = {
    backupFileExtension = "something.backup";
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {
      inherit inputs;
      inherit username;
      inherit userConfig;
      inherit systemConfig;
    };
    users.${username} = import ../home-manager/home.nix;
  };

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
    ./nh.nix
    ./greetd.nix
    ./hardware-configuration.nix
    ./packages.nix
    ./programs
    ./wm/hyprland.nix
    ./wm/niri.nix
    ./stylix
  ];

  # Userconfig services
  docker.enable = config.docker.enable;
  gaming.enable = config.gaming.enable;
  hyprland.enable = config.windowManager == "hyprland";
  niri.enable = config.windowManager == "niri";
  ollama.enable = config.ollama.enable;
  printing.enable = config.printing.enable;
  syncthing.enable = config.syncthing.enable;
  vm.enable = config.virtual-machine.enable;

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

  # Enable Tailscale
  services.tailscale.enable = true;

  # NixOS Version
  # -------------
  system.stateVersion = "25.11";
}
