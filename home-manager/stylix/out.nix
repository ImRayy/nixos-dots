{ config, pkgs, ... }:

{
  xdg.configFile = {
    "yazi/theme.toml" = with config.lib.stylix.colors; {
      source = pkgs.writeText "yazi-colors" ''
        [status]
        separator_style = { fg = "#${base01}", bg = "#${base01}" }
        mode_normal = { fg = "#${base00}", bg = "#${base0D}", bold = true }
        mode_select = { fg = "#${base00}", bg = "#${base0C}", bold = true }
        mode_unset = { fg = "#${base00}", bg = "#${base0F}", bold = true }
      '';
    };
  };
}
