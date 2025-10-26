{
  lib,
  config,
  ...
}: {
  options.docker = {
    enable = lib.mkEnableOption "Docker";
  };

  config = lib.mkIf config.docker.enable {
    virtualisation.docker = {
      enable = true;
      enableOnBoot = true;
      rootless = {
        enable = true;
        setSocketVariable = true;
      };
      autoPrune.enable = true;
    };
  };
}
