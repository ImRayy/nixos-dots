{inputs, ...}: {
  flake.modules.nixos.core = {config, ...}: {
    home-manager = {
      backupFileExtension = "home-manager.${config.networking.hostName}.bak";
      useGlobalPkgs = true;
      useUserPackages = true;
      extraSpecialArgs = {
        inherit inputs;
        username = config.preferences.username;
      };

      users.${config.preferences.username} = {
        home.username = config.preferences.username;
        home.homeDirectory = "/home/${config.preferences.username}";

        programs.home-manager.enable = true;

        news.display = "silent";
        manual = {
          html.enable = false;
          json.enable = false;
          manpages.enable = false;
        };

        home.stateVersion = "23.11"; # Please read the comment before changing.
      };
    };
  };
}
