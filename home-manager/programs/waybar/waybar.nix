{ lib, pkgs, homeConfig, ... }:

lib.mkIf (homeConfig.statusBar == "waybar") {
    programs.waybar = {
        enable = true;
        settings = [{
            "layer" = "top";
            "position" = "top";
            "margin" = "8px 8px 0 8px";
            "exclusive" = true;
            "passtrough" = false;
            "gtk-layer-shell" = true;
            "height" = 0;
            "modules-left" =[
                "custom/distro"
                "custom/separator"
                "hyprland/workspaces"
                "custom/separator"
                "cpu"
                "custom/separator"
                "memory"
            ];
            "modules-center" = [
                "mpris"
            ];
            "modules-right" = [
                "tray"
                "network"
                "custom/separator"
                "pulseaudio"
                "custom/separator"
                "clock"
                "custom/separator"
                "custom/powermenu"
            ];
            "custom/separator" = {
                "format" = "│";
                "interval" = "once";
                "tooltip"= false;
            };
            "custom/distro" = {
                "format" = " ";
                "on-click" = "kitty --hold -e neofetch";
                "interval" = "once";
                "tooltip" = false;
            };
            "hyprland/window" = {
                "format" = "{}";
                "max-length" = 50;
            };
            "hyprland/workspaces" = {
                "on-click" = "activate";
                "format" = "{icon}";
                "format-icons" = {
                    "default" = "";
                    "active" = "󰮯";
                    "urgent" = "󰊠";
                };
                "persistent_workspaces" = {
                    "*" = 5;
                };
            };
            "cpu" = {
                "interval" = 5;
                "format" = " {usage}%";
                "max-length" = 10;
            };
            "memory" = {
                "interval" = 30;
                "format" = " {used:0.1f}G/{total:0.1f}G";
            };
            "mpris" = {
                "format" = "{player_icon} {title} | {artist} - {length}";
                "format-paused" = "{status_icon} <i>{title} | {artist} - {length}</i>";
                "player-icons" = {
                    "default" = "▶";
                };
                "status-icons" = {
                    "paused" = "󰏤";
                };
                "ignored-players" = ["firefox" "chromium" "brave"];
            };
            "tray" = {
                "icon-size" = 15;
                "tooltip" = false;
                "spacing" = 10;
            };
            "clock" = {
                "format" = "{:󰥔 %R  󰃭 %A %d}";
                "on-click" = "eww open Calendar --toggle --config ~/.config/eww/applets/";
                "tooltip-format" = "{:%A %d %B %Y}";
            };
            "custom/swaync" = {
                "tooltip" = false;
                "format" = "{icon}";
                "format-icons" = {
                    "notification" = "󱅫";
                    "none" = "󰂚";
                    "dnd-notification" = "󱏧<span foreground='red'><sup></sup></span>";
                    "dnd-none" = "󱏧";
                    "inhibited-notification" = "󰂚<span foreground='red'><sup></sup></span>";
                    "inhibited-none" = "󰂚";
                    "dnd-inhibited-notification" = "<span foreground='red'><sup></sup></span>";
                    "dnd-inhibited-none" = "󱏧";
                };
                "return-type" = "json";
                "exec-if" = "which swaync-client";
                "exec" = "swaync-client -swb";
                "on-click" = "~/.config/swaync/scripts/open-tray.sh";
                "on-click-right" = "swaync-client -d -sw";
                "escape" = true;
            };
            "network" = {
                "format" = "{ifname}";
                "format-wifi" = "󰤨   {essid} {bandwidthTotalBytes}";
                "format-ethernet" = "󱓞 Ethernet {bandwidthTotalBytes}";
                "format-disconnected" = "󰤭 ";
                "tooltip-format" = "{ifname} via {gwaddr} 󰊗";
                "tooltip-format-wifi" = "󰤢   Signal Strength:  {signalStrength}%";
                "tooltip-format-ethernet" = "󰊗   Signal Strength:  {signalStrength}%";
                "on-click" = "~/.config/waybar/scripts/rofi-wifi-menu.sh";
                "tooltip-format-disconnected" = "Disconnected";
                "max-length" = 50;
                "interval" = 5;
            };
            "pulseaudio" = {
                "format" = "{icon} {volume}%";
                "tooltip" = false;
                "format-muted" = " Muted";
                "on-click" = "pamixer -t";
                "on-scroll-up" = "pamixer -i 5";
                "on-scroll-down" = "pamixer -d 5";
                "scroll-step" = 5;
                "format-icons" = {
                    "default" = [ "" "" " " " " ];
                };

            };
            "custom/powermenu" = {
              "format" = " ";
              "on-click" = "~/.config/rofi/powermenu.sh";
              "interval" = "once";
              "tooltip" = false;
            };
        }];
    };
}
