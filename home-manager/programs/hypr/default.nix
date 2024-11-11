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
    ./rules.nix
  ];

  wayland.windowManager.hyprland = {
    enable = isEnabled;
  };
}
