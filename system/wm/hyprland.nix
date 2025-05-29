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
    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
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
      loupe
      wl-clipboard
      wf-recorder
    ];
  };
}
