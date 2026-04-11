{lib, ...}: let
  mkMenu = pkgs: menu: let
    configFile =
      pkgs.writeText "config.yaml"
      (lib.generators.toYAML {} {
        anchor = "bottom-right";
        margin_right = 0;
        margin_bottom = 5;
        margin_left = 5;
        margin_top = 0;

        font = "JetBrainsMono Nerd Font 12";
        separator = " ➜ ";
        border_width = 2;
        corner_r = 15;
        padding = 15;
        rows_per_column = 5;
        column_padding = 25;
        inherit menu;
      });
  in
    pkgs.writeShellScriptBin "my-menu" ''
      exec ${lib.getExe pkgs.wlr-which-key} ${configFile}
    '';
in {
  flake.mkMenu = pkgs: menu: lib.getExe (mkMenu pkgs menu);
}
