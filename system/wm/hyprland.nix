{
  lib,
  inputs,
  config,
  pkgs,
  ...
}: {
  options.hyprland = {
    enable = lib.mkEnableOption "Hyprland";
  };

  config = lib.mkIf config.hyprland.enable {
    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    };

    xdg.portal = {
      enable = true;
      wlr.enable = true;
      extraPortals = with pkgs; [xdg-desktop-portal-gtk];

      config = {
        common = {
          default = ["gtk"];
          "org.freedesktop.impl.portal.Secret" = ["gnome-keyring"];
          "org.freedesktop.impl.portal.FileChooser" = ["nautilus"];
        };
      };
    };

    environment.systemPackages = with pkgs; [
      hypridle
      hyprpicker
      hyprshot
      loupe
      wl-clipboard
      wf-recorder
    ];
  };
}
