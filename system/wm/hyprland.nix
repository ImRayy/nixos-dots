{
  lib,
  config,
  pkgs,
  ...
}: {
  options.hyprland = {
    enable = lib.mkEnableOption "Hyprland";
  };

  config = lib.mkIf config.hyprland.enable {
    nix.settings = {
      substituters = ["https://hyprland.cachix.org"];
      trusted-public-keys = [
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      ];
    };

    programs.hyprland = {
      enable = true;
      withUWSM = true;
      xwayland.enable = true;
    };

    xdg.portal = {
      enable = true;
      wlr.enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
        xdg-desktop-portal
      ];
      configPackages = with pkgs; [
        xdg-desktop-portal
        xdg-desktop-portal-gtk
        xdg-desktop-portal-hyprland
      ];
    };

    services.greetd = {
      enable = true;
      settings.default_session = let
        tuigreet = "${pkgs.greetd.tuigreet}/bin/tuigreet";
      in {
        command = "${tuigreet} --time --remember-session --cmd Hyprland";
      };
    };

    systemd.tmpfiles.rules = [
      "d '/var/cache/greeter' - greeter greeter - -"
    ];

    environment.systemPackages = with pkgs; [
      hypridle
      hyprpicker
      hyprshot
      swww
      wl-clipboard
      wf-recorder
    ];
  };
}
