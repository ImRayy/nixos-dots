{
  flake.modules.nixos.everfrostNvidia = {config, ...}: {
    nixpkgs.config.cudaSupport = false;
    hardware.graphics.enable = true;
    # No 32-bit games/Wine: avoids nvidia + mesa lib32 (~700M).
    hardware.graphics.enable32Bit = false;
    # environment.sessionVariables."__EGL_VENDOR_LIBRARY_FILENAMES" = "${config.hardware.nvidia.package}/share/glvnd/egl_vendor.d/10_nvidia.json";
    services.xserver.videoDrivers = ["nvidia"];
    hardware.nvidia = {
      modesetting.enable = true;
      open = true;
      nvidiaSettings = false;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
    hardware.nvidia-container-toolkit.enable = true;
  };
}
