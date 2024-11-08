{
  lib,
  pkgs,
  inputs,
  systemConfig,
  ...
}:

let
  wm = systemConfig.windowManager;
  enabled = lib.mkIf (wm == "hyprland" || wm == "all");
in
enabled {
  nix.settings = {
    substituters = [ "https://hyprland.cachix.org" ];
    trusted-public-keys = [
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
    ];
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
  };

  environment.systemPackages = with pkgs; [
    hypridle
    hyprpicker
    hyprshade
    hyprshot
    swayimg
    swww
    wl-clipboard
  ];
}
