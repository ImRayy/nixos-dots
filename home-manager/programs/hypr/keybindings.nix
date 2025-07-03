{
  pkgs,
  username,
  ...
}: let
  screenshot_path = "/home/${username}/Pictures/Screenshots";

  hyprshot = pkgs.writeShellScriptBin "hyprshot.sh" ''
    if [[ ! -d ${screenshot_path} ]];then
      mkdir -p ${screenshot_path}
    fi

    ${pkgs.hyprshot}/bin/hyprshot -m region -o ${screenshot_path}
  '';

  terminal = "kitty";

  binding = m: c: k: a: "${m}, ${k}, ${c}, ${a}";
  shell = k: a: binding "SUPER" "exec" k "hyprctl dispatch global quickshell:${a}";
in {
  wayland.windowManager.hyprland = {
    settings = {
      bindm = [
        # Move/resize windows with mainMod + LMB/RMB and dragging
        "SUPER, mouse:272, movewindow"
        "SUPER, mouse:273, resizewindow"
      ];
      binde = [
        "SUPER,SPACE , togglefloating,"
        "SUPER, F, fullscreen,"
        "SUPER, Q, killactive,"
        "SUPER SHIFT, Q, exit,"
        "SUPER, C, exec, hyprctl dispatch centerwindow"
        "SUPER, T, exec, hyprctl dispatch togglesplit"
        "SUPER, P, pin, active"
        "ALT, L, exec, hyprlock"

        # Focus Window
        "SUPER, H, movefocus, l"
        "SUPER, L, movefocus, r"
        "SUPER, K, movefocus, u"
        "SUPER, J, movefocus, d"

        # Move Window
        "SUPER SHIFT, H, movewindow, l"
        "SUPER SHIFT, L, movewindow, r"
        "SUPER SHIFT, K, movewindow, u"
        "SUPER SHIFT, J, movewindow, d"

        # Special Window/Scrachpad
        "SUPER, S, togglespecialworkspace"
        "SUPER SHIFT, S, movetoworkspace, special"

        # Group
        "SUPER, G, togglegroup,"
        "SUPER SHIFT, G, lockgroups, toggle"
        "ALT SHIFT, H, changegroupactive, b"
        "ALT SHIFT, L, changegroupactive, f"

        # Workspaces
        "SUPER, 1, workspace, 1"
        "SUPER, 2, workspace, 2"
        "SUPER, 3, workspace, 3"
        "SUPER, 4, workspace, 4"
        "SUPER, 5, workspace, 5"

        # Move active window to a workspace with mainMod + SHIFT + [0-5]
        "SUPER SHIFT, 1, movetoworkspace, 1"
        "SUPER SHIFT, 2, movetoworkspace, 2"
        "SUPER SHIFT, 3, movetoworkspace, 3"
        "SUPER SHIFT, 4, movetoworkspace, 4"
        "SUPER SHIFT, 5, movetoworkspace, 5"

        # Scroll through existing workspaces with mainMod + scroll
        "SUPER, mouse_down, workspace, e+1"
        "SUPER, mouse_up, workspace, e-1"

        # Audio Control
        ",XF86AudioRaiseVolume, exec, pamixer --increase 5"
        ",XF86AudioLowerVolume, exec, pamixer --decrease 5"
        "SUPER SHIFT, P, exec, playerctl play-pause"

        # Apps
        "SUPER, RETURN, exec, ${terminal}"
        "SUPER SHIFT, RETURN, exec, nautilus"
        "SUPER, D, exec, ~/.config/hypr/dmenu.sh"
        "SUPER, E, exec, ${pkgs.smile}/bin/smile"
        "ALT, S, exec, ${hyprshot}/bin/hyprshot.sh"
        "ALT SHIFT, P, exec, ${pkgs.tessen}/bin/tessen"

        # Quickshell
        (shell "a" "launcher-apps")
        (shell "v" "launcher-clipboard")
        (shell "x" "powermenu")
      ];
    };
  };
}
