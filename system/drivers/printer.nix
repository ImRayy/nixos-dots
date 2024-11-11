{pkgs, ...}: {
  # Enable support for SANE scanenrs
  hardware.sane = {
    enable = true;
  };

  services.printing = {
    enable = true;
    drivers = [pkgs.gutenprint];
  };
}
