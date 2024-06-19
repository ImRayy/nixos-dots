{  config, pkgs, username, ... }:

{
  services = {
      syncthing = {
          enable = true;
          user = "ray";
          dataDir = "/home/${username}/.syncthing";
          configDir = "/home/${username}/.config/syncthing";
      };
  };
}
