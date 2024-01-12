{ config, pkgs, ... }:

{
    hardware.opengl.enable = true;
      services.xserver.videoDrivers = ["nvidia"];
      boot.kernelPackages = pkgs.linuxPackages_latest;
      hardware.nvidia = {
          modesetting.enable = true;
          open = false;
          nvidiaSettings = false;
        package = config.boot.kernelPackages.nvidiaPackages.stable;
      };
}
