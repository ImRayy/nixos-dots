# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page and in the NixOS manual (accessible by running ‘nixos-help’). { config, pkgs, ... }:

{ config, pkgs, ...}:


{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  networking.hostName = "nixos";  
 
  services.ipp-usb.enable = true;

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_IN";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN";
    LC_NAME = "en_IN";
    LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN";
    LC_TELEPHONE = "en_IN";
    LC_TIME = "en_IN";
  };


  # Enable Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
	
  # Current Shell
  programs.zsh.enable = true;
  
  users.users.ray = {
    isNormalUser = true;
    description = "ray";
    extraGroups = [ "networkmanager" "wheel" "audio" "lp" "scanner" "libvirtd" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
    ];
  }; 
  
  environment.variables = {
      ZDOTDIR = "$HOME/.config/zsh";
  };
	
  # Services
  # --------

# services.resolved = {
#   enable = true;
#   dnssec = "true";
#   domains = [ "~." ];
#   fallbackDns = [ "1.1.1.1#one.one.one.one" "1.0.0.1#one.one.one.one" ];
#   extraConfig = ''
#     DNSOverTLS=yes
#   '';
# };
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };
 

  # Enable SSD Trim
  services.fstrim.enable = true;


  programs.gnupg.agent = {
     enable = true;
     enableSSHSupport = true;
   };


  # Enable the OpenSSH daemon.
  services.openssh.enable = true;  
  programs.kdeconnect.enable = true;

  # NixOS Version
  # -------------
  system.stateVersion = "23.05";

}
