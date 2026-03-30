{
  flake.modules.homeManager.hyprland = {
    wayland.windowManager.hyprland.settings = {
      animations = {
        enabled = "yes";
        bezier = [
          "quart, 0.25, 1, 0.5, 1"
          "snap, 0.15, 1, 0.3, 1"
          "winIn, 0.05, 0.9, 0.15, 1"
          "winOut, 0.2, -0.2, 0, 1"
          "slide, 0.1, 1, 0.2, 1"
          "specialSwitch, 0.1, 0.9, 0.15, 1"
        ];
        animation = [
          "border, 1, 5, snap"
          "borderangle, 1, 5, quart"
          "fade, 1, 5, snap"
          "fadeDim, 1, 5, snap"
          "layers, 1, 5, slide, slide"
          "specialWorkspace, 1, 5, specialSwitch, slidefadevert 10%"
          "windowsIn, 1, 5, winIn, slide"
          "windowsMove, 1, 5, snap, slide"
          "windowsOut, 1, 4, winOut, slide"
          "workspaces, 1, 5, slide, slide"
        ];
      };
    };
  };
}
