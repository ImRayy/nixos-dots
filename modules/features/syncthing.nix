{
  flake.modules.nixos.syncthing = {config, ...}: let
    username = config.preferences.username;
    home = "/home/${username}";
  in {
    services.syncthing = {
      enable = true;
      user = username;
      dataDir = "${home}/.syncthing";
      configDir = "${home}/.config/syncthing";
    };
  };
}
