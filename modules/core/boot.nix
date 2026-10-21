{
  flake.modules.nixos.core = {pkgs, ...}: let
  in {
    boot.tmp.useTmpfs = true;
    boot.tmp.tmpfsSize = "30%";
    boot.loader = {
      systemd-boot.enable = false;
      timeout = 60;
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
      grub = {
        devices = ["nodev"];
        enable = true;
        efiSupport = true;
        useOSProber = true;
      };
    };

    boot.supportedFilesystems = ["ntfs"];
    boot.kernelPackages = pkgs.linuxPackages;
    boot.consoleLogLevel = 0;
    boot.initrd.verbose = false;
    boot.kernelParams = [
      "nvidia-drm.modeset=1"
      "loglevel=3"
      "udev.log_priority=3"
    ];
  };
}
