{
  pkgs,
  config,
  ...
}: let
  storePath = "${config.home.homeDirectory}/.password-store";
in {
  programs.password-store = {
    enable = true;
    package = pkgs.pass.withExtensions (exts: [
      exts.pass-import
      exts.pass-tomb
    ]);
    settings = {
      PASSWORD_STORE_DIR = storePath;
    };
  };
}
