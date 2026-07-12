{inputs, ...}: {
  flake.modules.nixos.desktop = {pkgs, ...}: {
    environment.systemPackages = [
      inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
  };
}
