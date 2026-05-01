{
  flake.modules.homeManager.gtk = {
    pkgs,
    username,
    ...
  }: let
    homeDir = "/home/${username}";
    media = "/media/Storage";
  in {
    gtk = {
      enable = true;
      cursorTheme = {
        name = "Bibata-Modern-Ice";
        package = pkgs.bibata-cursors;
      };
      iconTheme = {
        name = "Tela-circle-dark";
        package = pkgs.tela-circle-icon-theme;
      };

      gtk3.bookmarks = [
        "file://${homeDir}/Documents"
        "file://${homeDir}/Downloads"
        "file://${media}/GitHub"
        "file://${homeDir}/Music"
        "file://${homeDir}/Pictures"
        "file://${homeDir}/Pictures/Screenshots"
        "file://${homeDir}/Videos"
      ];
    };

    home.pointerCursor = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 24;
    };
  };
}
