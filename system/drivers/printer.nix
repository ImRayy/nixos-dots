{pkgs, ...}: {
  # Enable support for SANE scanenrs
  hardware.sane = {
    enable = false;
  };

  services.printing = {
    enable = false;
    drivers = [pkgs.gutenprint];
  };
}
