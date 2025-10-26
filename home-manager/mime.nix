{userConfig, ...}: let
  fileAssociations = {
    image = {
      formats = ["jpeg" "jpg" "png" "webp" "avif"];
      defaultApp = userConfig.mime.image;
    };
    "x-scheme-handler" = {
      formats = ["http" "https" "about" "unknown" "tg" "chrome"];
      defaultApp = userConfig.mime.browser;
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
      defaultApp = userConfig.mime.browser;
    };
    text = {
      formats = ["html"];
      defaultApp = userConfig.mime.browser;
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
