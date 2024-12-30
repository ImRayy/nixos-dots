{config, ...}: {
  nixpkgs.config.cudaSupport = true;
  hardware.graphics.enable = true;
  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia = {
    modesetting.enable = true;
    open = true;
    nvidiaSettings = false;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}
