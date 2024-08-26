{
  lib,
  config,
  pkgs,
  inputs,
  systemConfig,
  ...
}:

let
  wm = systemConfig.windowManager;
  enabled = lib.mkIf (wm == "qtile" || wm == "all");
in

enabled {
  services.xserver.windowManager.qtile.enable = true;
  xdg.portal = {
    enable = true;
    config = {
      common = {
        default = [ "gtk" ];
        "org.freedesktop.impl.portal.Secret" = [ "gnome-keyring" ];
      };
    };
  };

  environment.systemPackages = with pkgs; [
    betterlockscreen
    feh
    flameshot
    haskellPackages.greenclip
    mypy
    picom
    redshift
    xcb-util-cursor
    xclip
  ];
}
