{
  wayland.windowManager.hyprland.settings = {
    windowrule = [
      # Size
      "size 800 600, org.keepassxc.KeePassXC"
      "size 900 800,title:^(Save File)$"
      "size 900 800,class:^(download)$"
      "size 900 800,title:^(Open File)$"
      "float, title:^(Smile)$"

      # Position
      "float, org.keepassxc.KeePassXC"
    ];

    windowrulev2 = ["noblur, title:^()$, class:^()$"];

    layerrule = ["animation default,selection"];
  };
}
