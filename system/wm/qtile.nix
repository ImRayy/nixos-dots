{
  lib,
  pkgs,
  config,
  ...
}: {
  options.qtile = {
    enable = lib.mkEnableOption "Qtile";
  };

  config = lib.mkIf config.qtile.enable {
    services.xserver.windowManager.qtile.enable = true;
    xdg.portal = {
      enable = true;
      config = {
        common = {
          default = ["gtk"];
          "org.freedesktop.impl.portal.Secret" = ["gnome-keyring"];
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
  };
}
