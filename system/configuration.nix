{ config, pkgs, sysConf, userConf, ...}:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  networking.hostName = sysConf.hostname;  
 
  services.ipp-usb.enable = true;

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = sysConf.timezone;

  # Select internationalisation properties.
  i18n.defaultLocale = sysConf.locale;

  i18n.extraLocaleSettings = {
    LC_ADDRESS = sysConf.locale;
    LC_IDENTIFICATION = sysConf.locale;
    LC_MEASUREMENT = sysConf.locale;
    LC_MONETARY = sysConf.locale;
    LC_NAME = sysConf.locale;
    LC_NUMERIC = sysConf.locale;
    LC_PAPER = sysConf.locale;
    LC_TELEPHONE = sysConf.locale;
    LC_TIME = sysConf.locale;
  };

services.stubby = {
      enable = true;
      settings = pkgs.stubby.passthru.settingsExample // {
        upstream_recursive_servers = [{
          address_data = "1.1.1.1";
          tls_auth_name = "cloudflare-dns.com";
          tls_pubkey_pinset = [{
            digest = "sha256";
            value = "GP8Knf7qBae+aIfythytMbYnL+yowaWVeD6MoLHkVRg=";
          }];
        } {
          address_data = "1.0.0.1";
          tls_auth_name = "cloudflare-dns.com";
          tls_pubkey_pinset = [{
            digest = "sha256";
            value = "GP8Knf7qBae+aIfythytMbYnL+yowaWVeD6MoLHkVRg=";
          }];
        }];
      };
    };

  # Enable Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
	
  # Current Shell
  programs.fish.enable = true;
  
  users.users.${userConf.username}= {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" "audio" "lp" "scanner" "libvirtd" ];
    shell = pkgs.fish;
  }; 

  environment.variables = {
      # QT_STYLE_OVERRIDE ="kvantum";
      QT_QPA_PLATFORMTHEME = "qt5ct";
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
    
  # Enable the OpenSSH daemon.
  services.openssh.enable = true;  
  programs.kdeconnect.enable = true;

  # NixOS Version
  # -------------
  system.stateVersion = "23.05";
}
