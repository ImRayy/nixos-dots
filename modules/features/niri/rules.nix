let
  border-radius = 8.0;
in {
  flake.modules.homeManager.niri = {
    programs.niri.settings.window-rules = [
      {
        geometry-corner-radius = {
          top-left = border-radius;
          top-right = border-radius;
          bottom-left = border-radius;
          bottom-right = border-radius;
        };

        clip-to-geometry = true;
      }

      {
        matches = [
          {app-id = "^org\\.keepassxc\\.KeePassXC$";}
          {app-id = "^org\\.gnome\\.World\\.Secrets$";}
        ];

        block-out-from = "screen-capture";
      }
    ];

    programs.niri.settings.layer-rules = [
      {
        matches = [
          {namespace = "^noctalia-overview*";}
        ];

        place-within-backdrop = true;
      }
    ];
  };
}
