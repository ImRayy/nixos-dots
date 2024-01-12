{  config, pkgs, ... }:

{

  services = {
      syncthing = {
          enable = true;
          user = "ray";
          dataDir = "/home/ray/Documents";
          configDir = "/home/ray/.config/syncthing";
      };
  };
}
