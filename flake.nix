{
  description = "Nixos config flake";

  nixConfig = {
    extra-substituters = [
      "https://nix-community.cachix.org"
      "https://yazi.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "yazi.cachix.org-1:Dcdz63NZKfvUCbDGngQDAZq6kOroIrFoyO064uvLh8k="
    ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
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

    stylix = {
      url = "github:danth/stylix/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    distro-grub-themes.url = "github:AdisonCavani/distro-grub-themes";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    yazi.url = "github:sxyazi/yazi";
  };

  outputs = {
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    stylix,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    unstablePkgs = import nixpkgs-unstable {
      system = system;
      config.allowUnfree = true;
    };

    # System & Home Manager Configuration
    inherit (import ./options.nix) username systemConfig userConfig;
  in {
    homeConfigurations = {
      ray = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {
          inherit unstablePkgs;
          inherit inputs;
          inherit username;
          inherit userConfig;
          inherit systemConfig;
        };

        modules = [
          stylix.homeModules.stylix
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
        inherit unstablePkgs;
      };
      modules = [
        ./system/configuration.nix
        {
          nix.settings = {
            trusted-users = [username];
            warn-dirty = false;
            substituters = ["https://cuda-maintainers.cachix.org"];
            trusted-public-keys = [
              "cuda-maintainers.cachix.org-1:0dq3bujKpuEPMCX6U4WylrUDZ9JyUG0VpVZa7CNfq5E="
            ];
          };
        }
      ];
    };
  };
}
