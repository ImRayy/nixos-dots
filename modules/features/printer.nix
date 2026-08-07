{
  flake.modules.nixos.printer = {pkgs, ...}: {
    services.ipp-usb.enable = false;

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
