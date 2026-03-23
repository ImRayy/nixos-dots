{pkgs, ...}: {
  home.packages = with pkgs; [
    niri
    xdg-desktop-portal-gnome
    loupe
    wl-clipboard
    wf-recorder
  ];

  systemd.user.targets.niri-session = {
    Unit = {
      Description = "Niri compositor session";
      Documentation = "man:systemd.special(7)";
      BindsTo = "graphical-session.target";
      Wants = "graphical-session-pre.target";
      After = "graphical-session-pre.target";
    };
  };

  systemd.user.services.xdg-desktop-portal = {
    Unit = {
      Description = "Portal service";
      After = [
        "graphical-session.target"
        "pipewire.service"
      ];
      PartOf = ["graphical-session.target"];
    };
    Service = {
      Type = "dbus";
      BusName = "org.freedesktop.portal.Desktop";
      ExecStart = "${pkgs.xdg-desktop-portal}/libexec/xdg-desktop-portal";
      Restart = "on-failure";
      Environment = [
        "XDG_CURRENT_DESKTOP=niri"
        "WAYLAND_DISPLAY=wayland-1"
      ];
    };
    Install.WantedBy = ["graphical-session.target"];
  };

  systemd.user.services.xdg-desktop-portal-gnome = {
    Unit = {
      Description = "Portal service (GNOME implementation)";
      After = [
        "graphical-session.target"
        "pipewire.service"
      ];
      PartOf = ["graphical-session.target"];
      Requires = ["pipewire.service"];
    };
    Service = {
      Type = "dbus";
      BusName = "org.freedesktop.impl.portal.desktop.gnome";
      ExecStart = "${pkgs.xdg-desktop-portal-gnome}/libexec/xdg-desktop-portal-gnome";
      Restart = "on-failure";
      Environment = [
        "XDG_CURRENT_DESKTOP=niri"
      ];
    };
    Install.WantedBy = ["graphical-session.target"];
  };

  systemd.user.services.xdg-desktop-portal-gtk = {
    Unit = {
      Description = "Portal service (GTK/GNOME implementation)";
      After = [
        "graphical-session.target"
      ];
      PartOf = ["graphical-session.target"];
    };
    Service = {
      Type = "dbus";
      BusName = "org.freedesktop.impl.portal.desktop.gtk";
      ExecStart = "${pkgs.xdg-desktop-portal-gtk}/libexec/xdg-desktop-portal-gtk";
      Restart = "on-failure";
    };
    Install.WantedBy = ["graphical-session.target"];
  };

  # XDG Desktop Portal configuration for Niri
  xdg.configFile."xdg-desktop-portal/portals.conf".text = ''
    [preferred]
    default=gtk
    org.freedesktop.impl.portal.FileChooser=gtk
    org.freedesktop.impl.portal.Screenshot=gnome
    org.freedesktop.impl.portal.ScreenCast=gnome
  '';

  xdg.configFile."xdg-desktop-portal/niri-portals.conf".text = ''
    [preferred]
    default=gtk
    org.freedesktop.impl.portal.FileChooser=gtk
    org.freedesktop.impl.portal.Screenshot=gnome
    org.freedesktop.impl.portal.ScreenCast=gnome
  '';
}
