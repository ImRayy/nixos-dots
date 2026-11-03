{
  flake.modules.nixos.core = {pkgs, ...}: let
  in {
    services.greetd = {
      enable = true;
      settings.default_session = let
        tuigreet = "${pkgs.tuigreet}/bin/tuigreet";
      in {
        command = "${tuigreet} --time --remember-session --cmd niri";
      };
    };

    systemd.tmpfiles.rules = [
      "d '/var/cache/greeter' - greeter greeter - -"
    ];
  };
}
