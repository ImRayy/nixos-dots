{
  pkgs,
  userConfig,
  ...
}: let
  sessionMap = {
    hyprland = "start-hyprland";
    niri = "niri-session";
  };

  desktopSession = sessionMap.${userConfig.windowManager or "hyprland"};
in {
  services.greetd = {
    enable = true;
    settings.default_session = let
      tuigreet = "${pkgs.tuigreet}/bin/tuigreet";
    in {
      command = "${tuigreet} --time --remember-session --cmd ${desktopSession}";
    };
  };

  systemd.tmpfiles.rules = [
    "d '/var/cache/greeter' - greeter greeter - -"
  ];
}
