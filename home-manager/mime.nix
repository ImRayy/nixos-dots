{ config, pkgs, ... }:

let
  fileAssociations = {
    image = {
      formats = [
        "jpeg"
        "jpg"
        "png"
        "webp"
        "avif"
      ];
      defaultApp = "org.gnome.eog.desktop";
    };
    others = {
      formats = [
        "x-scheme-handler/http"
        "x-scheme-handler/https"
        "x-scheme-handler/chrome"
        "text/html"
        "application/x-extension-htm"
        "application/x-extension-html"
        "application/x-extension-shtml"
        "application/xhtml+xml"
        "application/x-extension-xhtml"
        "application/x-extension-xht"
      ];
      defaultApp = "brave.desktop";
    };
  };

  makeAssociations =
    type:
    { formats, defaultApp }:
    map (format: {
      name = "${type}/${format}";
      value = [ defaultApp ];
    }) formats;

  allAssociations = builtins.concatLists (
    builtins.attrValues (builtins.mapAttrs makeAssociations fileAssociations)
  );
in
{
  xdg.mimeApps = {
    enable = true;
    defaultApplications = builtins.listToAttrs allAssociations;
  };
}
