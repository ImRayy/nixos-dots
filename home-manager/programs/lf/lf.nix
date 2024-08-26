{ config, pkgs, ... }:
{
  xdg.configFile."lf/icons".source = ./icons;
  programs.lf = {
    enable = true;
    settings = {
      preview = true;
      icons = true;
    };
  };
}
