{inputs, ...}: {
  flake.modules.nixos.hyprland = {pkgs, ...}: {
    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    };

    environment.systemPackages = with pkgs; [
      hyprpicker
      hyprshot
      loupe
      wl-clipboard
      wf-recorder
    ];
  };

  flake.modules.homeManager.hyprland = {pkgs, ...}: {
    wayland.windowManager.hyprland.enable = true;
    wayland.windowManager.hyprland.package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    wayland.windowManager.hyprland.settings = {
      exec-once = [
        "quickshell &"
        "wl-paste --type text --watch cliphist store &"
        "wl-paste --type image --watch cliphist store &"
      ];

      "$mod" = "SUPER";

      monitor = ",preferred,auto,1";
      input = {
        kb_layout = "us";
        follow_mouse = 1;
      };

      general = {
        gaps_in = 3;
        gaps_out = 6;
        border_size = 3;
        layout = "master";
      };

      master = {
        mfact = 0.50;
        new_on_top = true;
        new_on_active = true;
      };

      decoration = {
        blur = {
          enabled = true;
          size = 6;
          passes = 2;
          new_optimizations = true;
          noise = 0.1;
          xray = true;
          ignore_opacity = true;
        };

        shadow = {
          enabled = true;
          range = 8;
          render_power = 2;
        };

        rounding = 0;
      };

      cursor = {
        no_hardware_cursors = false;
        persistent_warps = true;
      };

      dwindle = {
        pseudotile = "yes";
        preserve_split = "yes";
      };
    };
  };
}
