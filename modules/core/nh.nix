{
  flake.modules.nixos.core = {config, ...}: {
    programs.nh = {
      enable = false;
      clean = {
        enable = true;
        extraArgs = "--keep 5 --keep-since 7d";
      };
      flake = "/home/${config.preferences.username}/.nixos-dots";
    };
  };
}
