{
  pkgs,
  userConfig,
  ...
}: let
  colorScheme = with userConfig; ./themes/${theme}/${theme}.yaml;
in {
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
    qt.enable = true;
    dunst.enable = true;
    waybar.enable = false;
    kitty = {
      enable = true;
      variant256Colors = true;
    };
    foot.enable = true;
    # tmux.enable = true;
    zellij.enable = true;
    gtk.enable = true;
    fzf.enable = true;
    nushell.enable = true;
    lazygit.enable = true;
    firefox.enable = false;
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
      package = pkgs.noto-fonts-emoji;
      name = "Noto Color Emoji";
    };
  };
}
