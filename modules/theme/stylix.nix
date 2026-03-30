let
  colorScheme = ./themes/gruvbox/gruvbox.yaml;
in {
  flake.modules.nixos.theme = {pkgs, ...}: {
    stylix.image = pkgs.fetchurl {
      url = "https://browsecat.art/sites/default/files/minimal-solar-system-wallpapers-52665-196251-5747315.png";
      sha256 = "1picl90amxs3vlpkj1ricjaf2yhgd09lny3jhxv5mf6q5pi2q56i";
    };

    stylix = {
      enable = true;
      autoEnable = false;
      base16Scheme = colorScheme;
      polarity = "dark";
      opacity.terminal = 0.8;
    };

    stylix.targets = {
      plymouth.enable = false;
      grub.enable = false;
    };

    stylix.fonts = {
      serif = {
        package = pkgs.cantarell-fonts;
        name = "Cantarell";
      };

      sansSerif = {
        package = pkgs.cantarell-fonts;
        name = "Cantarell";
      };

      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font";
      };

      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };
    };
  };

  flake.modules.homeManager.theme = {
    stylix = {
      enable = true;
      targets = {
        foot.enable = true;
        hyprland.enable = true;
        zellij.enable = true;
        gtk.enable = true;
        fzf.enable = true;
        lazygit.enable = true;
        firefox.enable = true;
        qt.enable = true;
        mpv.enable = true;
        starship.enable = true;
        yazi.enable = true;
        zen-browser.enable = true;
        zen-browser.profileNames = ["default"];
      };
    };
  };
}
