{ lib, pkgs, ... }:

{
  programs.waybar = {
    settings = [
      {
        "layer" = "top";
        "position" = "top";
        "margin" = "0";
        "exclusive" = true;
        "passtrough" = false;
        "gtk-layer-shell" = true;
        "height" = 0;
        "modules-left" = [
          "custom/distro"
          "hyprland/workspaces"
          "custom/cpu-icon"
          "cpu"
          "custom/memory-icon"
          "memory"
          "custom/flatpak-icon"
          "custom/flatpak-value"
        ];

        "modules-center" = [
          "mpris#icon"
          "mpris#value"
        ];

        "modules-right" = [
          "tray"
          "network#icon"
          "network#value"
          "pulseaudio#icon"
          "pulseaudio#value"
          "custom/clock-icon"
          "clock"
          "custom/powermenu"
        ];

        "custom/distro" = {
          "format" = "";
          "on-click" = "foot --hold -e neofetch";
          "interval" = "once";
          "tooltip" = false;
        };

        "hyprland/window" = {
          "format" = "{}";
          "max-length" = 50;
        };

        "hyprland/workspaces" = {
          "all-outputs" = false;
          "active-only" = false;
          "on-click" = "activate";
          "disable-scroll" = true;
          "persistent-workspaces" = {
            "1" = [ ];
            "2" = [ ];
            "3" = [ ];
            "4" = [ ];
            "5" = [ ];
          };
          "format" = "{icon}";
          "format-icons" = {
            "default" = "";
            "active" = "";
            "urgent" = "";
            "empty" = "";
          };
          "sort-by-number" = true;
        };

        # CPU
        "custom/cpu-icon" = {
          "format" = "";
          "tooltip" = false;
        };
        "cpu" = {
          "interval" = 2;
          "format" = "{usage}%";
          "tooltip" = false;
        };

        # MEMORY
        "custom/memory-icon" = {
          "format" = "";
          "tooltip" = false;
        };
        "memory" = {
          "interval" = 20;
          "format" = "{used:0.1f}G/{total:0.1f}G";
          "tooltip" = false;
        };

        # FLATPAK
        "custom/flatpak-icon" = {
          "format" = "{}";
          "on-click" = "foot --hold -e flatpak update";
          "exec" = "echo ";
          "exec-if" = "which flatpak";
          "interval" = "once";
          "tooltip" = false;
        };
        "custom/flatpak-value" = {
          "exec" = "flatpak remote-ls --updates | wc -l";
          "exec-if" = "which flatpak";
          "interval" = 3600; # Check every hour
          "tooltip" = false;
        };

        # MPRIS
        "mpris#icon" = {
          "format" = "{player_icon}";
          "format_paused" = "{status_icon} ";
          "player-icons" = {
            "default" = "▶";
            "mpv" = "";
            "spotify" = "";
            "brave" = "";
            "firefox" = "󰈹";

          };
          "status-icons" = {
            "paused" = "󰏤";
          };
          "tooltip" = false;
        };
        "mpris#value" = {
          "format" = "{title}";
          "format-paused" = "<i>{title}</i>";
          "ignored-players" = [
            "firefox"
            "chromium"
          ];
          "tooltip" = false;
          "max-length" = 50;
        };
        "tray" = {
          "icon-size" = 15;
          "tooltip" = false;
          "spacing" = 10;
        };

        # NETWORK
        "network#icon" = {
          "format" = "()";
          "format-wifi" = "󰤨";
          "format-ethernet" = "";
          "format-disconnected" = "󰤭";
          "tooltip" = false;
        };
        "network#value" = {
          "format" = "{ifname}";
          "format-wifi" = "{essid} {bandwidthTotalBytes}";
          "format-ethernet" = "Ethernet {bandwidthTotalBytes}";
          "format-disconnected" = "Disconnected";
          "tooltip" = false;
          "max-length" = 50;
          "interval" = 5;
        };

        # PULSEAUDIO
        "pulseaudio#icon" = {
          "format" = "{icon}";
          "format-muted" = " ";
          "format-icons" = {
            "default" = [
              ""
              ""
            ];
          };
          "on-click" = "pamixer -t";
          "on-scroll-up" = "pamixer -i 5";
          "on-scroll-down" = "pamixer -d 5";
        };
        "pulseaudio#value" = {
          "format" = "{volume}%";
          "tooltip" = false;
          "format-muted" = "Muted";
          "scroll-step" = 5;
        };

        # CLOCK
        "custom/clock-icon" = {
          "format" = "";
          "tooltip" = false;
        };
        "clock" = {
          "format" = "{:%R}";
          "format-alt" = "{:%R - %d %b, %Y (%A)}";
          "tooltip" = false;
        };

        # POWERMENU
        "custom/powermenu" = {
          "format" = " ";
          "on-click" = "~/.config/rofi/powermenu.sh";
          "interval" = "once";
          "tooltip" = "Open powermenu";
        };
      }
    ];
  };
}
