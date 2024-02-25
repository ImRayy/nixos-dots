{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
    stylix.url = "github:danth/stylix";
    ags.url = "github:Aylur/ags";
  };

  outputs = { self, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      # System & Home Manager Configuration
      inherit ( import ./config.nix ) username systemConfig homeConfig;

    in {
      homeConfigurations = {
          ray = inputs.home-manager.lib.homeManagerConfiguration {
              inherit pkgs;
              extraSpecialArgs = {
                  inherit inputs;
                  inherit username;
                  inherit homeConfig;
              };
              modules = [ 
                  inputs.stylix.homeManagerModules.stylix
                  ./home-manager/home.nix 
                  ./home-manager  
              ];
          };
      };
      nixosConfigurations.default = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
            inherit username;
            inherit systemConfig;
          };
          modules = [ 
            ./system/configuration.nix
            ./system
          ];
        };

    };
}
