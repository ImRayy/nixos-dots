{ config, pkgs, ... }:
{
    stylix.image = pkgs.fetchurl {
      url = "https://w.wallhaven.cc/full/wy/wallhaven-wy98vp.jpg";
      sha256 = "135hibjs4298p0832klphccfqwwlpiipcfymaal5953zh073qjsx";

    };
    stylix = {
        autoEnable = false;
        polarity = "dark";
        targets  = {
            waybar.enable = false;
            kitty = {
                enable = true;
                variant256Colors = true;
            };
            gtk.enable = true;
            firefox.enable = false;
            swaylock = {
                enable = true;
                useImage = true;
            };

        };
        opacity.terminal = 0.8;
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
    home.file = {
        # swww executable script
        ".swww-stylix" = {
            text = ''
            #!/usr/bin/env bash
            swww img ''+config.stylix.image+''
            '';
            executable = true;
        };
    };
}
