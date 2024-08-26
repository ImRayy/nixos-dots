{
  config,
  pkgs,
  homeConfig,
  ...
}:
let
  colorScheme = with homeConfig; ./themes/${theme}/${theme}.yaml;
in
{
  stylix.image = pkgs.fetchurl {
    url = "https://browsecat.art/sites/default/files/minimal-solar-system-wallpapers-52665-196251-5747315.png";
    sha256 = "1picl90amxs3vlpkj1ricjaf2yhgd09lny3jhxv5mf6q5pi2q56i";

  };
  stylix = {
    autoEnable = false;
    base16Scheme = colorScheme;
    polarity = "dark";
    targets = {
      dunst.enable = true;
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
      mako.enable = true;
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
      text =
        ''
          #!/usr/bin/env bash

          if [[ $XDG_SESSION_TYPE = wayland ]]; then
          	swww img ''
        + config.stylix.image
        + ''

          else
          	feh --bg-fill ''
        + config.stylix.image
        + ''

          fi
        '';
      executable = true;
    };
  };
}
