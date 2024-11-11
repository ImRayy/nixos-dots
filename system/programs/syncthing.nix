{
  lib,
  config,
  username,
  ...
}: {
  options.syncthing = {
    enable = lib.mkEnableOption "Syncthing";
  };

  config = lib.mkIf config.syncthing.enable {
    services = {
      syncthing = {
        enable = true;
        user = "ray";
        dataDir = "/home/${username}/.syncthing";
        configDir = "/home/${username}/.config/syncthing";
      };
    };
  };
}
