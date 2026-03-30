{
  flake.modules.homeManager.hyprland = {
    wayland.windowManager.hyprland.settings = {
      windowrule = [
        # "noblur, title:^$, class:^$"
        "match:class it.mijorus.smile, float on, rounding 6, animation popin"
        "match:class org.keepassxc.KeePassXC, float on, size 800 600"

        # Music Players
        "match:title Tauon, float on, size 800 600, center on"

        # File Pickers
        "match:title Save Image, size 800 600, animation popin, float on"
        "match:title Save As, size 800 600, animation popin, float on"
        "match:title File Upload, size 800 600, animation popin, float on"
        "match:title Save File, size 800 600, animation popin, float on"
      ];

      layerrule = [
        "match:namespace selection, animation default"
        "match:namespace (quickshell::launcher)(.*), animation popin 85%"
        "match:namespace quickshell::powermenu, animation popin 85%"
        "match:namespace quickshell::alert-dialog, animation slide bottom"
        "match:namespace quickshell::wallpapers, animation slide bottom"
      ];
    };
  };
}
