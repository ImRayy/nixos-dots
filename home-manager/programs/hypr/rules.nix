{
  wayland.windowManager.hyprland.settings = {
    windowrule = [
      # Size
      "size 900 800,title:^(Save File)$"
      "size 900 800,class:^(download)$"
      "size 900 800,title:^(Open File)$"

      # Emoji Picker
      "float, title:^(Smile)$"

      # Position
      "float, org.keepassxc.KeePassXC"
      "size 800 600, org.keepassxc.KeePassXC"
    ];

    windowrulev2 = [
      # Disables weird blur border
      "noblur, title:^()$, class:^()$"

      # Terminal Musicplayer
      "size 800 540, initialTitle:^(music-player)$"
      "center, initialTitle:^(music-player)$"
      "float, initialTitle:^(music-player)$"
    ];

    layerrule = ["animation default,selection"];
  };
}
