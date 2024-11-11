{config, ...}: {
  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    GOPATH = "${config.home.homeDirectory}/.local/share/go";
    GOMODCACHE = "${config.home.homeDirectory}/.cache/go/pkg/mod";
    VOLTA_HOME = "${config.home.homeDirectory}/.volta";
  };
}
