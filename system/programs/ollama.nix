{
  lib,
  config,
  pkgs,
  ...
}: {
  options.ollama = {
    enable = lib.mkEnableOption "Ollama";
  };

  config = lib.mkIf config.ollama.enable {
    services.ollama = {
      enable = true;
      package = pkgs.ollama;
      acceleration = "cuda";
    };
  };
}
