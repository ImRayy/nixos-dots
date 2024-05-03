{ config, pkgs, username, systemConfig,...}:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  networking.hostName = systemConfig.hostname;
 
  services.ipp-usb.enable = true;

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = systemConfig.timezone;

  # Select internationalisation properties.
  i18n.defaultLocale = systemConfig.locale;

  i18n.extraLocaleSettings = with systemConfig; {
    LC_ADDRESS = locale;
    LC_IDENTIFICATION = locale;
    LC_MEASUREMENT = locale;
    LC_MONETARY = locale;
    LC_NAME = locale;
    LC_NUMERIC = locale;
    LC_PAPER = locale;
    LC_TELEPHONE = locale;
    LC_TIME = locale;
  };

  # Enable Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
	
  # Current Shell
  programs.fish.enable = true;
  
  users.users.${username}= {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" "audio" "lp" "scanner" "libvirtd" ];
    shell = pkgs.fish;
  }; 

  environment.variables = {
      # QT_STYLE_OVERRIDE ="kvantum";
      QT_QPA_PLATFORMTHEME = "qt5ct";
      EDITOR = "nvim";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
 
  # Enable SSD Trim
  services.fstrim = {
      enable = true;
      interval = "weekly";
  };

  programs.gnupg.agent = {
     enable = true;
     enableSSHSupport = true;
   };
    
  # To support mtp/android file transfer
  services.gvfs.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;  
  programs.kdeconnect.enable = true;

  programs.nix-ld = {
      enable = true;
      libraries = with pkgs; [
          stdenv.cc.cc.lib
      ];
  };

  # NixOS Version
  # -------------
  system.stateVersion = "23.05";
}
