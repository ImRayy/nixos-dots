{ lib, config, pkgs, username, ... }:

let 
    qtileConfig = pkgs.fetchFromGitHub {
      owner = "ImRayy";
      repo = "qtile-config";
      rev = "master";
      sha256 = "1jji3nr8v6iqyhxd7l8fhdid8h2ykvpny7f4aa03g5a9b176146a";
    };
    targetDir = "/home/${username}/.config/";
in 
{
    home.file."qtile" = {
            source = qtileConfig;
            target = "${targetDir}/qtile";
    };

    xdg.configFile."stylix-colors.json" = with config.lib.stylix.colors; {
        source = pkgs.writeText "ags-colors" ''
            {
              "base00": "#${base00}",
              "base01": "#${base01}",
              "base02": "#${base02}",
              "base03": "#${base03}",
              "base04": "#${base04}",
              "base05": "#${base05}",
              "base06": "#${base06}",
              "base07": "#${base07}",
              "base08": "#${base08}",
              "base09": "#${base09}",
              "base0A": "#${base0A}",
              "base0B": "#${base0B}",
              "base0C": "#${base0C}",
              "base0D": "#${base0D}",
              "base0E": "#${base0E}",
              "base0F": "#${base0F}"
            }
        '';
    };
}
