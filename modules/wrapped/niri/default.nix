{
  self,
  inputs,
  ...
}: {
  flake.modules.nixos.niri = {pkgs, ...}: {
    programs.niri = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.niri-wm;
    };
  };

  perSystem = {
    pkgs,
    lib,
    ...
  }: let
    noctalia = self.packages.${pkgs.stdenv.hostPlatform.system}.noctalia-shell;
    noctaliaExec = lib.getExe noctalia;
    noctaliaDump = noctalia.dump-noctalia-shell;
    noctaliaCopy = noctalia.copy-noctalia-shell-config;
    border-radius = 8.0;
  in {
    packages.niri-wm = inputs.wrapper-modules.wrappers.niri.wrap {
      inherit pkgs;

      settings = {
        # ----------------------------------
        # GENERAL SETTINGS
        # ----------------------------------
        xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;
        hotkey-overlay.skip-at-startup = true;
        prefer-no-csd = true;

        # ----------------------------------
        # STARTUP APPS
        # ----------------------------------
        spawn-at-startup = [
          noctaliaExec
          "wl-paste --type text --watch cliphist store"
          "wl-paste --type image --watch cliphist store"
        ];

        # ----------------------------------
        # General & UI
        # ----------------------------------
        layout = {
          background-color = "transparent";
          gaps = 12;
          center-focused-column = "never";
          always-center-single-column = true;
          preset-column-widths = [
            {proportion = 0.33333;}
            {proportion = 0.5;}
            {proportion = 0.66667;}
          ];
          default-column-width.proportion = 0.5;

          shadow = {
            on = _: {};
            softness = 30;
            spread = 5;
            color = "#0007";
            offset = _: {
              props.x = 0;
              props.y = 5;
            };
          };
        };

        # ----------------------------------
        # KEY BINDINGS
        # ----------------------------------
        binds = {
          "Mod+Shift+Slash".show-hotkey-overlay = _: {};
          "Mod+O" = _: {
            props.repeat = false;
            content.toggle-overview = _: {};
          };
          "Mod+Q" = _: {
            props.repeat = false;
            content.close-window = _: {};
          };
          "Mod+Shift+E".quit = _: {};
          "Ctrl+Alt+Delete".quit = _: {};
          "Mod+Escape" = _: {
            props.allow-inhibiting = false;
            content.toggle-keyboard-shortcuts-inhibit = _: {};
          };
          "Mod+Shift+P".power-off-monitors = _: {};

          # --- Program Launches ---
          "Mod+Return" = _: {
            content.spawn-sh = "foot";
            props.hotkey-overlay-title = "Open a Terminal: alacritty";
          };
          "Super+Alt+L" = _: {
            content.spawn-sh = "hyprlock";
            props.hotkey-overlay-title = "Lock the Screen: hyprlock";
          };
          "Super+Alt+S" = _: {
            content.spawn-sh = "pkill orca || exec orca";
            props.allow-when-locked = true;
          };

          # --- Media Keys ---
          "XF86AudioRaiseVolume" = _: {
            props.allow-when-locked = true;
            content.spawn = ["sh" "-c" "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+"];
          };
          "XF86AudioLowerVolume" = _: {
            props.allow-when-locked = true;
            content.spawn = ["sh" "-c" "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-"];
          };
          "XF86AudioMute" = _: {
            props.allow-when-locked = true;
            content.spawn = ["sh" "-c" "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"];
          };
          "XF86AudioMicMute" = _: {
            props.allow-when-locked = true;
            content.spawn = ["sh" "-c" "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"];
          };

          # --- Navigation (Vim-style & Arrows) ---
          "Mod+Left".focus-column-left = _: {};
          "Mod+Down".focus-window-down = _: {};
          "Mod+Up".focus-window-up = _: {};
          "Mod+Right".focus-column-right = _: {};
          "Mod+H".focus-column-left = _: {};
          "Mod+J".focus-window-down = _: {};
          "Mod+K".focus-window-up = _: {};
          "Mod+L".focus-column-right = _: {};

          "Mod+Shift+Left".move-column-left = _: {};
          "Mod+Shift+Down".move-window-down = _: {};
          "Mod+Shift+Up".move-window-up = _: {};
          "Mod+Shift+Right".move-column-right = _: {};
          "Mod+Shift+H".move-column-left = _: {};
          "Mod+Shift+J".move-window-down = _: {};
          "Mod+Shift+K".move-window-up = _: {};
          "Mod+Shift+L".move-column-right = _: {};

          "Mod+Home".focus-column-first = _: {};
          "Mod+End".focus-column-last = _: {};
          "Mod+Ctrl+Home".move-column-to-first = _: {};
          "Mod+Ctrl+End".move-column-to-last = _: {};

          # --- Workspaces ---
          "Mod+Page_Down".focus-workspace-down = _: {};
          "Mod+Page_Up".focus-workspace-up = _: {};
          "Mod+U".focus-workspace-down = _: {};
          "Mod+I".focus-workspace-up = _: {};
          "Mod+Ctrl+U".move-column-to-workspace-down = _: {};
          "Mod+Ctrl+I".move-column-to-workspace-up = _: {};
          "Mod+Shift+Page_Down".move-workspace-down = _: {};
          "Mod+Shift+Page_Up".move-workspace-up = _: {};
          "Mod+Shift+U".move-workspace-down = _: {};
          "Mod+Shift+I".move-workspace-up = _: {};

          # --- Scroll Wheel ---
          "Mod+WheelScrollDown" = _: {
            content.focus-workspace-down = _: {};
            props.cooldown-ms = 150;
          };
          "Mod+WheelScrollUp" = _: {
            content.focus-workspace-up = _: {};
            props.cooldown-ms = 150;
          };
          "Mod+Ctrl+WheelScrollDown" = _: {
            content.move-column-to-workspace-down = _: {};
            props.cooldown-ms = 150;
          };
          "Mod+Ctrl+WheelScrollUp" = _: {
            content.move-column-to-workspace-up = _: {};
            props.cooldown-ms = 150;
          };

          "Mod+WheelScrollRight".focus-column-right = _: {};
          "Mod+WheelScrollLeft".focus-column-left = _: {};
          "Mod+Ctrl+WheelScrollRight".move-column-right = _: {};
          "Mod+Ctrl+WheelScrollLeft".move-column-left = _: {};

          "Mod+Shift+WheelScrollDown".focus-column-right = _: {};
          "Mod+Shift+WheelScrollUp".focus-column-left = _: {};
          "Mod+Ctrl+Shift+WheelScrollDown".move-column-right = _: {};
          "Mod+Ctrl+Shift+WheelScrollUp".move-column-left = _: {};

          # --- Indexed Workspaces (1-9) ---
          "Mod+1".focus-workspace = 1;
          "Mod+2".focus-workspace = 2;
          "Mod+3".focus-workspace = 3;
          "Mod+4".focus-workspace = 4;
          "Mod+5".focus-workspace = 5;
          "Mod+6".focus-workspace = 6;
          "Mod+7".focus-workspace = 7;
          "Mod+8".focus-workspace = 8;
          "Mod+9".focus-workspace = 9;
          "Mod+Shift+1".move-column-to-workspace = 1;
          "Mod+Shift+2".move-column-to-workspace = 2;
          "Mod+Shift+3".move-column-to-workspace = 3;
          "Mod+Shift+4".move-column-to-workspace = 4;
          "Mod+Shift+5".move-column-to-workspace = 5;
          "Mod+Shift+6".move-column-to-workspace = 6;
          "Mod+Shift+7".move-column-to-workspace = 7;
          "Mod+Shift+8".move-column-to-workspace = 8;
          "Mod+Shift+9".move-column-to-workspace = 9;

          # --- Layout & Windows ---
          "Mod+BracketLeft".consume-or-expel-window-left = _: {};
          "Mod+BracketRight".consume-or-expel-window-right = _: {};
          "Mod+Period".expel-window-from-column = _: {};

          "Mod+R".switch-preset-column-width = _: {};
          "Mod+Shift+R".switch-preset-window-height = _: {};
          "Mod+Ctrl+R".reset-window-height = _: {};
          "Mod+F".maximize-column = _: {};
          "Mod+Shift+F".fullscreen-window = _: {};
          "Mod+Ctrl+F".expand-column-to-available-width = _: {};

          "Mod+Minus".set-column-width = "-10%";
          "Mod+Equal".set-column-width = "+10%";
          "Mod+Shift+Minus".set-window-height = "-10%";
          "Mod+Shift+Equal".set-window-height = "+10%";

          "Mod+Space".toggle-window-floating = _: {};
          "Mod+Shift+Space".switch-focus-between-floating-and-tiling = _: {};
          "Mod+W".toggle-column-tabbed-display = _: {};

          # --- Screenshots ---
          "Mod+S".screenshot = _: {};
          "Mod+Shift+S".screenshot-screen = _: {};
          "Mod+Shift+W".screenshot-window = _: {};

          # --- Noctalia Shell ---
          "Mod+A" = _: {
            content.spawn-sh = "${noctaliaExec} ipc call launcher toggle";
            props.hotkey-overlay-title = "Noctalia: Launcher";
          };
          "Mod+V" = _: {
            content.spawn-sh = "${noctaliaExec} ipc call launcher clipboard";
            props.hotkey-overlay-title = "Noctalia: Clipboard";
          };
          "Mod+C" = _: {
            content.spawn-sh = "${noctaliaExec} ipc call calendar toggle";
            props.hotkey-overlay-title = "Noctalia: Calendar";
          };
          "Mod+X" = _: {
            content.spawn-sh = "${noctaliaExec} ipc call sessionMenu toggle";
            props.hotkey-overlay-title = "Noctalia: Session Menu";
          };
          "Mod+M" = _: {
            content.spawn-sh = "${noctaliaExec} ipc call systemMonitor toggle";
            props.hotkey-overlay-title = "Noctalia: System Monitor";
          };
          "Mod+Comma" = _: {
            content.spawn-sh = "${noctaliaExec} ipc call settings open";
            props.hotkey-overlay-title = "Noctalia: Settings";
          };

          "Alt+Shift+P".spawn-sh = lib.getExe pkgs.tessen;

          "Mod+D".spawn-sh = self.mkMenu pkgs [
            {
              key = "w";
              desc = "Wallpapers";
              cmd = "${noctaliaExec} ipc call wallpaper toggle";
            }
            {
              key = "W";
              desc = "Window Switcher";
              cmd = "${noctaliaExec} ipc call launcher windows";
            }
            {
              key = "n";
              desc = "Notes Scratchpa";
              cmd = "${noctaliaExec} ipc call plugin:notes-scratchpad togglePanel";
            }
            {
              key = "t";
              desc = "Todos";
              cmd = "${noctaliaExec} ipc call plugin:todo togglePanel";
            }
            {
              key = "k";
              desc = "KDE Connect";
              cmd = "${noctaliaExec} ipc call plugin:kde-connect toggle";
            }
            {
              key = "r";
              desc = "Reset Shell";
              cmd = "${noctaliaDump}; ${noctaliaCopy}; pkill quickshell; ${noctaliaExec}";
            }
          ];
        };

        # ----------------------------------
        # WINDOW RULES
        # ----------------------------------
        window-rules = [
          {
            geometry-corner-radius = builtins.genList (_: border-radius) 4;
            clip-to-geometry = true;
          }

          {
            matches = [{app-id = "^org\\.keepassxc\\.KeePassXC$";}];
            block-out-from = "screen-capture";
          }
        ];

        # ----------------------------------
        # LAYER RULES
        # ----------------------------------
        layer-rules = [
          {
            matches = [
              {namespace = "^noctalia-overview*";}
            ];

            place-within-backdrop = true;
          }
        ];
      };
    };
  };
}
