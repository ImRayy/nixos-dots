{
  config,
  pkgs,
  ...
}: {
  nixpkgs.config.cudaSupport = true;
  hardware.graphics.enable = true;
  services.xserver.videoDrivers = ["nvidia"];
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelParams = [
    "nvidia-drm.modeset=1"
    # "nvidia-drm.fbdev=1"
  ];
  hardware.nvidia = {
    modesetting.enable = true;
    open = true;
    nvidiaSettings = false;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}
