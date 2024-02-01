{ config, pkgs, inputs, ... }:
let
    inherit (inputs.nix-colors.lib-contrib {inherit pkgs;}) gtkThemeFromScheme;)
in
rec {
    gtk = {
        enable = true;
        theme = {
            name = "${config.colorScheme.slug}";
            package = gtkThemeFromScheme {scheme = config.colorScheme;};
        };
        # theme = {
        #     name = "Catppuccin-Mocha-Standard-Lavender-Dark";
        #     package = pkgs.catppuccin-gtk.override {
        #     accents = [ "lavender" ];
        #     size = "standard";
        #     tweaks = [ "rimless" ];
        #     variant = "mocha";
        #     };
        # };
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
