{ config, pkgs, ... }:
{
    home.packages = with pkgs; [ hyprpaper ];
    stylix.image = pkgs.fetchurl {
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
    #  home.file.".swww-stylix".text = ''
    #   '';
    # home.file.".swww-stylix".executable = true;
    home.file = {
        # swww executable script
        ".swww-stylix" = {
            text = ''
            #!/usr/bin/env bash
            swww img ''+config.stylix.image+''
            '';
            executable = true;
        };
        # hyprpaper config file
        ".config/hypr/hyprpaper.conf" = {
            text = with config.stylix; ''
                preload = ''+image+''

                wallpaper = HDMI-A-1,''+image+''

                splash = true

                ipc = off
            '';
        };

    };
}
