{
  self,
  inputs,
  ...
}: {
  flake.nixosConfigurations.everfrost = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.modules.nixos.everfrostConfiguration
      inputs.stylix.nixosModules.stylix
      inputs.home-manager.nixosModules.home-manager
    ];
  };
}
