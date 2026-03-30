let
  browser = "zen-beta.desktop";
  image = "org.gnome.Loupe.desktop";

  fileAssociations = {
    image = {
      formats = ["jpeg" "jpg" "png" "webp" "avif"];
      defaultApp = image;
    };
    "x-scheme-handler" = {
      formats = ["http" "https" "about" "unknown" "tg" "chrome"];
      defaultApp = browser;
    };
    "application" = {
      formats = [
        "x-extension-htm"
        "x-extension-html"
        "x-extension-shtml"
        "xhtml+xml"
        "x-extension-xhtml"
        "x-extension-xht"
      ];
      defaultApp = browser;
    };
    text = {
      formats = ["html"];
      defaultApp = browser;
    };
  };

  makeAssociations = type: {
    formats,
    defaultApp,
  }:
    map (format: {
      name = "${type}/${format}";
      value = [defaultApp];
    })
    formats;

  allAssociations = builtins.concatLists (
    builtins.attrValues (builtins.mapAttrs makeAssociations fileAssociations)
  );
in {
  flake.modules.homeManager.desktop = {
    xdg.mimeApps = {
      enable = true;
      defaultApplications = builtins.listToAttrs allAssociations;
    };
  };
}
