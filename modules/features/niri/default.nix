{inputs, ...}: {
  flake.modules.nixos.niri = {pkgs, ...}: {
    nixpkgs.overlays = [inputs.niri-flake.overlays.niri];

    imports = [inputs.niri-flake.nixosModules.niri];

    programs.niri = {
      enable = true;
      package = inputs.niri-flake.packages.${pkgs.stdenv.hostPlatform.system}.niri-stable;
    };

    niri-flake.cache.enable = true;

    environment.systemPackages = with pkgs; [
      loupe
      wl-clipboard
      wf-recorder
    ];
  };

  flake.modules.homeManager.niri = {
    programs.niri.settings = {
      spawn-at-startup = [
        {sh = "wl-paste --type text --watch cliphist store";}
        {sh = "wl-paste --type image --watch cliphist store";}
      ];

      layout = {
        background-color = "transparent";
        gaps = 12;
        center-focused-column = "never";
        always-center-single-column = true;
        preset-column-widths = [
          {proportion = 0.33333;}
          {proportion = 0.5;}
          {proportion = 0.66667;}
        ];
        default-column-width.proportion = 0.5;

        shadow = {
          enable = true;
          softness = 30;
          spread = 5;
          color = "#0007";
          offset = {
            x = 0;
            y = 5;
          };
        };
      };

      hotkey-overlay.skip-at-startup = true;
      prefer-no-csd = true;
    };
  };
}
