{
  description = "Nixos config flake";

  nixConfig = {
      extra-substituters = [
          "https://nix-community.cachix.org"
          "https://hyprland.cachix.org"
      ];
      extra-trusted-public-keys = [
          "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
          "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      ];
  };

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
            {
              nix.settings = {
                  trusted-users = [ username ];
              };
            }
          ];
        };

    };
}
