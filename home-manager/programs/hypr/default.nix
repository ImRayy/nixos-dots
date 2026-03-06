{
  lib,
  userConfig,
  ...
}: let
  isEnabled = userConfig.windowManager == "hyprland";
in {
  imports = lib.optionals isEnabled [
    ./hyprland.nix
    ./hyprlock.nix
    ./keybindings.nix
    ./hypridle.nix
  ];
}
