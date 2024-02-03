{ config, pkgs, ... }:
{
    stylix.image = pkgs.fetchurl {
      # url = "https://w.wallhaven.cc/full/85/wallhaven-8586my.png";
      # sha256 = "18vl3lqfpcxk01pr4pyshgyvzq8hz4bxmbl470wigjinzzy2wdkl";
      url = "https://w.wallhaven.cc/full/wy/wallhaven-wy98vp.jpg";
      sha256 = "135hibjs4298p0832klphccfqwwlpiipcfymaal5953zh073qjsx";

    };
    stylix = {
        polarity = "dark";
        targets.waybar.enable = false;
        opacity.terminal = 0.8;
        targets = { 
            kitty.variant256Colors = true;
            firefox.enable = false;
        };
        fonts = {
            serif = {
                package = pkgs.cantarell-fonts;
                name = "Cantarell";
            };

            sansSerif = {
                package = pkgs.cantarell-fonts;
                name = "Cantarell";
            };

            monospace = {
                package = pkgs.commit-mono;
                name = "CommitMono Nerd Font Mono";
            };

            emoji = {
                  package = pkgs.noto-fonts-emoji;
                  name = "Noto Color Emoji";
            };
        };
    };
     home.file.".swww-stylix".text = ''
        #!/usr/bin/env bash
        swww img ''+config.stylix.image+''
      '';
    home.file.".swww-stylix".executable = true;
}
