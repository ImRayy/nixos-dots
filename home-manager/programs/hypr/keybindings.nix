{
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

                # Volumme Control
                ",XF86AudioRaiseVolume, exec, pamixer --increase 5"
                ",XF86AudioLowerVolume, exec, pamixer --decrease 5"

                # Apps
                "SUPER, RETURN, exec, kitty"
                "SUPER SHIFT, RETURN, exec, nemo"
                "SUPER, D, exec, ~/.config/hypr/dmenu.sh"
                "SUPER, A , exec,  rofi -show drun -show-icons -theme ~/.config/rofi/themes/default.rasi"
                "SUPER, E, exec, rofi -modi emoji -show emoji -config  ~/.config/rofi/launchers/type-1/style-6.rasi"
                "SUPER, N, exec,  swaync-client -t -sw"
                "SUPER ALT , L , exec, ~/.config/swaylock/lock.sh"
                "SUPER, X , exec, ~/.config/rofi/powermenu.sh"
            ];
        };
        extraConfig = ''
            binde = SUPER, V, exec, cliphist list | rofi -dmenu -theme-str 'configuration{dmenu{display-name:"󰅌 ";}} listview{scrollbar:true;}' -theme ~/.config/rofi/themes/default.rasi | cliphist decode | wl-copy
        '';
    };
}
