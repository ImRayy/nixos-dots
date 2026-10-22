{
  flake.modules.homeManager.fastfetch = {pkgs, ...}: let
    fastfetch-image = pkgs.fetchurl {
      url = "https://ik.imagekit.io/rayshold/dotfiles/_config/neofetch/2B.png";
      sha256 = "18rgqabsfkpxgw15yfynavcsk277vax2rw3668i9ici6p7ixjpiy";
    };
  in {
    programs.fastfetch = {
      enable = true;
      settings = {
        logo = {
          type = "sixel"; # [sixel | kitty | chafa]
          source = "${fastfetch-image}";
          width = 33;
          padding = {
            top = 1;
            left = 1;
            right = 2;
          };
        };

        display = {
          separator = "";
          constants = ["──────────────────────"];
        };

        modules = [
          "break"
          "break"

          {
            type = "custom";
            format = "{#1;31}A N I M E | L I N U X";
          }
          {
            type = "custom";
            format = "──────────────────────";
          }
          "break"

          {
            type = "users";
            key = " ";
            keyColor = "red";
          }
          {
            type = "os";
            key = " ";
            keyColor = "green";
            format = "{name} {arch}";
          }
          {
            type = "de";
            key = "󰍹 ";
            keyColor = "yellow";
          }
          {
            type = "shell";
            key = " ";
            keyColor = "blue";
          }
          {
            type = "terminal";
            key = " ";
            keyColor = "cyan";
          }
          {
            type = "uptime";
            key = "󱑀 ";
            keyColor = "cyan";
          }
          {
            type = "packages";
            key = " ";
            keyColor = "magenta";
          }
          {
            type = "memory";
            key = " ";
            keyColor = "white";
          }
          {
            type = "cpu";
            key = " ";
            keyColor = "light_green";
          }
          {
            type = "gpu";
            key = "󰊖 ";
            keyColor = "light_red";
          }

          "break"
          {
            type = "custom";
            format = "──────────────────────";
          }
          {
            type = "colors";
            symbol = "circle";
            paddingLeft = 0;
          }
        ];
      };
    };
  };
}
