{ config, pkgs, ... }:
rec {
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
    };
}
