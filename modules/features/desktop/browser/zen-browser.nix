{inputs, ...}: {
  flake.modules.homeManager.desktop = {pkgs, ...}: let
    defaults = import ./_firefoxSettings.nix;
  in {
    imports = [
      inputs.zen-browser.homeModules.beta
    ];

    programs.zen-browser = {
      enable = true;
      profiles.default = {
        id = 0;
        name = "default";
        isDefault = true;
        inherit (defaults) settings;
      };
    };

    programs.chromium = {
      enable = true;
      package = pkgs.brave;
      extensions = [
        "joggkdfebigddmaagckekihhfncdobff" # Le Git Graph
        "bggfcpfjbdkhfhfmkjpbhnkhnpjjeomc" # Material Icons for GitHub
        "ghmbeldphafepmbegfdlkpapadhbakde" # Proton Pass
        "amknoiejhlmhancpahfcfcfhllgkpbld" # Hoppscotch
      ];
    };
  };
}
