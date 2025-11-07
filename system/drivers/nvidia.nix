{
  pkgs,
  config,
  ...
}: {
  nixpkgs.config.cudaSupport = true;
  hardware.graphics.enable = true;
  hardware.graphics.enable32Bit = true;
  environment.sessionVariables."__EGL_VENDOR_LIBRARY_FILENAMES" = "${config.hardware.nvidia.package}/share/glvnd/egl_vendor.d/10_nvidia.json";
  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia = {
    modesetting.enable = true;
    open = false;
    nvidiaSettings = false;
    package = config.boot.kernelPackages.nvidiaPackages.latest;
  };
}
