{
  lib,
  userConfig,
  ...
}: let
  isEnabled = userConfig.wm.hyprland.enable;
in {
  imports = lib.optionals isEnabled [
    ./hyprland.nix
    ./hyprlock.nix
    ./keybindings.nix
  ];

  wayland.windowManager.hyprland = {
    enable = isEnabled;
  };

  services.hypridle = {
    enable = true;
    settings = {
      general = {
        after_sleep_cmd = "hyprctl dispatch dpms on";
        ignore_dbus_inhibit = false;
        lock_cmd = "hyprlock";
      };

      listener = [
        {
          timeout = "870";
          on-timeout = "You're idle!";
        }
        {
          timeout = 400;
          on-timeout = "hyprlock";
        }
        {
          timeout = 600;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
      ];
    };
  };
}
