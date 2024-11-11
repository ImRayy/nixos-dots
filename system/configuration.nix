{
  pkgs,
  username,
  systemConfig,
  userConfig,
  ...
}: {
  nixpkgs.config.allowUnfree = true;

  imports = [
    (import ./locale.nix {inherit systemConfig;})
    ./boot.nix
    ./drivers
    ./firewall.nix
    ./fonts.nix
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
  vm.enable = false;

  # Services
  syncthing.enable = true;
  services = {
    xserver = {
      enable = true;
      excludePackages = [pkgs.xterm];
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

  # Current Shell
  programs.fish.enable = true;

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
    QT_QPA_PLATFORMTHEME = "qt5ct";
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
