{
  lib,
  config,
  pkgs,
  ...
}: {
  options.niri = {
    enable = lib.mkEnableOption "Niri";
  };

  config = lib.mkIf config.niri.enable {
    programs.niri.enable = true;

    xdg.portal = {
      enable = true;
      wlr.enable = true;
      config = {
        common = {
          default = ["gtk"];
          "org.freedesktop.impl.portal.Secret" = ["gnome-keyring"];
          "org.freedesktop.impl.portal.FileChooser" = ["nautilus"];
        };
      };
    };

    environment.systemPackages = with pkgs; [
      loupe
      wl-clipboard
      wf-recorder
    ];
  };
}
