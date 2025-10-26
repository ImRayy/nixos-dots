{
  lib,
  config,
  pkgs,
  ...
}: {
  options.shell = lib.mkOption {
    type = lib.types.enum ["fish" "zsh" "bash" "nu"];
    default = "fish";
    example = "zsh";
    description = lib.mdDoc "Default Home shell, Not system!!!";
  };

  config = lib.mkMerge (lib.mapAttrsToList (shell: path:
    lib.mkIf (config.shell == shell) {
      home.sessionVariables = {
        SHELL = path;
      };
    }) {
    fish = "${pkgs.fish}/bin/fish";
    zsh = "${pkgs.zsh}/bin/zsh";
    bash = "${pkgs.bash}/bin/bash";
    nu = "${pkgs.nushell}/bin/nu";
  });
}
