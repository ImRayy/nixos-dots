{
  lib,
  config,
  pkgs,
  ...
}: {
  options.printing = {
    enable = lib.mkEnableOption "Sane, Gutenprint and printing services";
  };

  config = lib.mkIf config.printing.enable {
    hardware.sane = {
      enable = true;
    };

    services.printing = {
      enable = true;
      drivers = [pkgs.gutenprint];
    };

    environment.systemPackages = with pkgs; [
      sane-backends
      simple-scan
    ];
  };
}
