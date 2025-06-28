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
    QT_QPA_PLATFORM = "wayland";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = 1;
    SHELL = "${pkgs.fish}/bin/fish";
  };
}
