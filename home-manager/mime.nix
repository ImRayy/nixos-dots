let
  defaultBrowser = "zen-beta.desktop";
  fileAssociations = {
    image = {
      formats = ["jpeg" "jpg" "png" "webp" "avif"];
      defaultApp = "org.gnome.Loupe.desktop";
    };
    "x-scheme-handler" = {
      formats = ["http" "https" "about" "unknown" "tg" "chrome"];
      defaultApp = defaultBrowser;
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
      defaultApp = defaultBrowser;
    };
    text = {
      formats = ["html"];
      defaultApp = defaultBrowser;
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
  xdg.mimeApps = {
    enable = true;
    defaultApplications = builtins.listToAttrs allAssociations;
  };
}
