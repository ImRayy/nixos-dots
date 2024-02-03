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
  };

  outputs = { self, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      # System Configuraton
      sysConf = {
        hostname = "nixos";
        timezone = "Asia/Kolkata";
        locale = "en_IN";
      };
      # User Configuration
      userConf = {
        username = "ray";
      };
    in {
      homeConfigurations = {
          ray = inputs.home-manager.lib.homeManagerConfiguration {
              inherit pkgs;
              extraSpecialArgs = {
                  inherit inputs;
                  inherit userConf;
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
            inherit sysConf;
            inherit userConf;
          };
          modules = [ 
            ./system/configuration.nix
            ./system
          ];
        };

    };
}
