{
  config,
  pkgs,
  ...
}: {
  home.sessionVariables = {
    NIXPKGS_ALLOW_UNFREE = "1";
    NIXOS_OZONE_WL = "1";
    GOPATH = "${config.home.homeDirectory}/.local/share/go";
    GOMODCACHE = "${config.home.homeDirectory}/.cache/go/pkg/mod";
    VOLTA_HOME = "${config.home.homeDirectory}/.volta";
    SHELL = "${pkgs.zsh}/bin/zsh";
    WINEPREFIX = "${config.xdg.dataHome}/wine";
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "${config.xdg.dataHome}/.steam/root/compatibilitytools.d";
  };
}
