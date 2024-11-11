{
  inputs,
  pkgs,
  ...
}: {
  # add the home manager module
  imports = [inputs.ags.homeManagerModules.default];

  home.packages = with pkgs; [
    bun
    hyprpicker
    hyprshade
    sassc
    zenity
  ];

  programs.ags = {
    enable = true;

    # null or path, leave as null if you don't want hm to manage the config
    configDir = inputs.ags-dots;

    # additional packages to add to gjs's runtime
    extraPackages = with pkgs; [
      libgtop
      gtksourceview
      webkitgtk
      accountsservice
    ];
  };
}
