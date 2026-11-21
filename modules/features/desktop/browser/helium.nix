{inputs, ...}: {
  flake.modules.nixos.helium = {pkgs, ...}: {
    environment.systemPackages = [
      inputs.helium.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
  };
}
