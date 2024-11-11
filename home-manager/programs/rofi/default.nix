{
  config,
  pkgs,
  ...
}: {
  imports = [./scripts/powermenu.nix];
  xdg.configFile = {
    "rofi/themes/default.rasi".source = ./themes/default.rasi;
    "rofi/themes/powermenu.rasi".source = ./themes/powermenu.rasi;
    "rofi/style.rasi" = with config.lib.stylix.colors; {
      source = pkgs.writeText "my-css" ''
        * {
            background:     #${base00};
            background-alt: #${base01};
            foreground:     #${base05};
            active:         #${base07};
            selected:       #${base02};
            selected-text:  #${base07};
        }
        /* vim:ft=css
      '';
    };
  };
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
  };
}
