{inputs, ...}: {
  flake.modules.nixos.ytm-rs = {pkgs, ...}: {
    environment.systemPackages = [
      inputs.ytm-rs.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
  };
}
