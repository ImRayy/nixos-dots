{
  description = "Nixos config flake";

  nixConfig = {
    extra-substituters = ["https://nix-community.cachix.org"];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ags.url = "github:Aylur/ags";
    ags-dots = {
      url = "github:ImRayy/ags-dots";
      flake = false;
    };

    qtile-dots = {
      url = "github:ImRayy/qtile-dots";
      flake = false;
    };

    stylix.url = "github:danth/stylix";
    distro-grub-themes.url = "github:AdisonCavani/distro-grub-themes";
  };

  outputs = {
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};

    # System & Home Manager Configuration
    inherit (import ./options.nix) username systemConfig userConfig;
  in {
    homeConfigurations = {
      ray = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {
          inherit inputs;
          inherit username;
          inherit userConfig;
          inherit systemConfig;
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
        inherit inputs system;
        inherit username;
        inherit systemConfig;
        inherit userConfig;
      };
      modules = [
        ./system/configuration.nix
        {
          nix.settings = {
            trusted-users = [username];
            warn-dirty = false;
          };
        }
      ];
    };
  };
}
