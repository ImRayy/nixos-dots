{inputs, ...}: {
  flake.modules.nixos.desktop = {
    imports = [
      inputs.noctalia.nixosModules.default
    ];

    programs.noctalia = {
      enable = true;
      recommendedServices.enable = true;
    };
  };
}
