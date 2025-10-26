{
  lib,
  config,
  username,
  ...
}: let
  home = "/home/${username}";
in {
  options.syncthing = {
    enable = lib.mkEnableOption "Syncthing";
  };

  config = lib.mkIf config.syncthing.enable {
    services.syncthing = {
      enable = true;
      user = username;
      dataDir = "${home}/.syncthing";
      configDir = "${home}/.config/syncthing";
    };
  };
}
