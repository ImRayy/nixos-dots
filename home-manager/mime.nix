let
  fileAssociations = {
    image = {
      formats = ["jpeg" "jpg" "png" "webp" "avif"];
      defaultApp = "org.gnome.eog.desktop";
    };
    "x-scheme-handler" = {
      formats = ["http" "https" "about" "unknown"];
      defaultApp = "io.github.zen_browser.zen.desktop";
    };
    text = {
      formats = ["html"];
      defaultApp = "io.github.zen_browser.zen.desktop";
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
