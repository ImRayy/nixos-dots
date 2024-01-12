{ config, pkgs, ... }:

{
  boot.loader = {
    systemd-boot.enable = false;
    timeout = 60; efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
    grub = {
      devices = [ "nodev" ];
      enable = true;
      efiSupport = true;
      useOSProber = true;
    };
  }; 
}
