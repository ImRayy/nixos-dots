{
  inputs,
  pkgs,
  config,
  ...
}: {
  # add the home manager module
  imports = [inputs.ags.homeManagerModules.default];

  home.packages = with pkgs; [
    bun
    hyprpicker
    hyprshade
    sass
    zenity
  ];

  programs.ags = {
    enable = true;

    # null or path, leave as null if you don't want hm to manage the config
    # configDir = inputs.ags-dots;
    configDir = null;

    # additional packages to add to gjs's runtime
    extraPackages = with pkgs;
      [
        fzf
        libgtop
        gtksourceview
        webkitgtk
        accountsservice
      ]
      ++ (map (component: inputs.ags.packages.${pkgs.system}.${component}) [
        "hyprland"
        "mpris"
        "network"
        "tray"
        "notifd"
        "wireplumber"
      ]);
  };

  xdg.configFile."stylix/ags-colors.scss" = with config.lib.stylix.colors; {
    source = pkgs.writeText "ags-colors" ''
      $base:    #${base00};
      $crust:   #${base00};
      $color00: #${base01};
      $color01: #${base07};
      $color02: #${base07};
      $color03: #${base0D};
      $color04: #${base08};
      $color05: #${base0B};
      $color06: #${base09};
      $color07: #${base0A};
      $color08: #${base00};
      $color09: #${base05};
      $color10: #${base0E};
      $color11: #${base0C};

      $bg-alt: transparentize(#${base01}, 0.5);
      $text: #${base05};
      $text-dimmed: transparentize(#${base05}, 0.4);
    '';
  };
}
