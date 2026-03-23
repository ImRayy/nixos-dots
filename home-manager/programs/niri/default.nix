{
  lib,
  userConfig,
  ...
}: let
  isEnabled = userConfig.windowManager == "niri";
in {
  imports = lib.optionals isEnabled [
    ./niri.nix
  ];
}
