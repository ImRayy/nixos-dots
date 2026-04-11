{self, ...}: {
  flake.modules.homeManager.niri = {
    lib,
    pkgs,
    ...
  }: let
    noctalia = self.packages.${pkgs.stdenv.hostPlatform.system}.noctalia-shell;
    noctaliaExec = lib.getExe noctalia;
    noctaliaDump = noctalia.dump-noctalia-shell;
    noctaliaCopy = noctalia.copy-noctalia-shell-config;
  in {
    programs.niri.settings.binds = {
      # --- General & UI ---
      "Mod+Shift+Slash".action.show-hotkey-overlay = {};
      "Mod+O" = {
        action.toggle-overview = {};
        repeat = false;
      };
      "Mod+Q" = {
        action.close-window = {};
        repeat = false;
      };
      "Mod+Shift+E".action.quit = {};
      "Ctrl+Alt+Delete".action.quit = {};
      "Mod+Escape" = {
        action.toggle-keyboard-shortcuts-inhibit = {};
        allow-inhibiting = false;
      };
      "Mod+Shift+P".action.power-off-monitors = {};

      # --- Program Launches ---
      "Mod+Return" = {
        action.spawn = ["foot"];
        hotkey-overlay.title = "Open a Terminal: alacritty";
      };
      "Super+Alt+L" = {
        action.spawn = ["hyprlock"];
        hotkey-overlay.title = "Lock the Screen: hyprlock";
      };
      "Super+Alt+S" = {
        action.spawn = ["sh" "-c" "pkill orca || exec orca"];
        allow-when-locked = true;
      };

      # --- Media Keys ---
      "XF86AudioRaiseVolume" = {
        action.spawn = ["sh" "-c" "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+"];
        allow-when-locked = true;
      };
      "XF86AudioLowerVolume" = {
        action.spawn = ["sh" "-c" "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-"];
        allow-when-locked = true;
      };
      "XF86AudioMute" = {
        action.spawn = ["sh" "-c" "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"];
        allow-when-locked = true;
      };
      "XF86AudioMicMute" = {
        action.spawn = ["sh" "-c" "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"];
        allow-when-locked = true;
      };

      # --- Navigation (Vim-style & Arrows) ---
      "Mod+Left".action.focus-column-left = {};
      "Mod+Down".action.focus-window-down = {};
      "Mod+Up".action.focus-window-up = {};
      "Mod+Right".action.focus-column-right = {};
      "Mod+H".action.focus-column-left = {};
      "Mod+J".action.focus-window-down = {};
      "Mod+K".action.focus-window-up = {};
      "Mod+L".action.focus-column-right = {};

      "Mod+Shift+Left".action.move-column-left = {};
      "Mod+Shift+Down".action.move-window-down = {};
      "Mod+Shift+Up".action.move-window-up = {};
      "Mod+Shift+Right".action.move-column-right = {};
      "Mod+Shift+H".action.move-column-left = {};
      "Mod+Shift+J".action.move-window-down = {};
      "Mod+Shift+K".action.move-window-up = {};
      "Mod+Shift+L".action.move-column-right = {};

      "Mod+Home".action.focus-column-first = {};
      "Mod+End".action.focus-column-last = {};
      "Mod+Ctrl+Home".action.move-column-to-first = {};
      "Mod+Ctrl+End".action.move-column-to-last = {};

      # --- Workspaces ---
      "Mod+Page_Down".action.focus-workspace-down = {};
      "Mod+Page_Up".action.focus-workspace-up = {};
      "Mod+U".action.focus-workspace-down = {};
      "Mod+I".action.focus-workspace-up = {};
      "Mod+Ctrl+U".action.move-column-to-workspace-down = {};
      "Mod+Ctrl+I".action.move-column-to-workspace-up = {};
      "Mod+Shift+Page_Down".action.move-workspace-down = {};
      "Mod+Shift+Page_Up".action.move-workspace-up = {};
      "Mod+Shift+U".action.move-workspace-down = {};
      "Mod+Shift+I".action.move-workspace-up = {};

      # --- Scroll Wheel ---
      "Mod+WheelScrollDown" = {
        action.focus-workspace-down = {};
        cooldown-ms = 150;
      };
      "Mod+WheelScrollUp" = {
        action.focus-workspace-up = {};
        cooldown-ms = 150;
      };
      "Mod+Ctrl+WheelScrollDown" = {
        action.move-column-to-workspace-down = {};
        cooldown-ms = 150;
      };
      "Mod+Ctrl+WheelScrollUp" = {
        action.move-column-to-workspace-up = {};
        cooldown-ms = 150;
      };

      "Mod+WheelScrollRight".action.focus-column-right = {};
      "Mod+WheelScrollLeft".action.focus-column-left = {};
      "Mod+Ctrl+WheelScrollRight".action.move-column-right = {};
      "Mod+Ctrl+WheelScrollLeft".action.move-column-left = {};

      "Mod+Shift+WheelScrollDown".action.focus-column-right = {};
      "Mod+Shift+WheelScrollUp".action.focus-column-left = {};
      "Mod+Ctrl+Shift+WheelScrollDown".action.move-column-right = {};
      "Mod+Ctrl+Shift+WheelScrollUp".action.move-column-left = {};

      # --- Indexed Workspaces (1-9) ---
      "Mod+1".action.focus-workspace = 1;
      "Mod+2".action.focus-workspace = 2;
      "Mod+3".action.focus-workspace = 3;
      "Mod+4".action.focus-workspace = 4;
      "Mod+5".action.focus-workspace = 5;
      "Mod+6".action.focus-workspace = 6;
      "Mod+7".action.focus-workspace = 7;
      "Mod+8".action.focus-workspace = 8;
      "Mod+9".action.focus-workspace = 9;
      "Mod+Shift+1".action.move-column-to-workspace = 1;
      "Mod+Shift+2".action.move-column-to-workspace = 2;
      "Mod+Shift+3".action.move-column-to-workspace = 3;
      "Mod+Shift+4".action.move-column-to-workspace = 4;
      "Mod+Shift+5".action.move-column-to-workspace = 5;
      "Mod+Shift+6".action.move-column-to-workspace = 6;
      "Mod+Shift+7".action.move-column-to-workspace = 7;
      "Mod+Shift+8".action.move-column-to-workspace = 8;
      "Mod+Shift+9".action.move-column-to-workspace = 9;

      # --- Layout & Windows ---
      "Mod+BracketLeft".action.consume-or-expel-window-left = {};
      "Mod+BracketRight".action.consume-or-expel-window-right = {};
      "Mod+Period".action.expel-window-from-column = {};

      "Mod+R".action.switch-preset-column-width = {};
      "Mod+Shift+R".action.switch-preset-window-height = {};
      "Mod+Ctrl+R".action.reset-window-height = {};
      "Mod+F".action.maximize-column = {};
      "Mod+Shift+F".action.fullscreen-window = {};
      "Mod+Ctrl+F".action.expand-column-to-available-width = {};

      "Mod+Minus".action.set-column-width = "-10%";
      "Mod+Equal".action.set-column-width = "+10%";
      "Mod+Shift+Minus".action.set-window-height = "-10%";
      "Mod+Shift+Equal".action.set-window-height = "+10%";

      "Mod+Space".action.toggle-window-floating = {};
      "Mod+Shift+Space".action.switch-focus-between-floating-and-tiling = {};
      "Mod+W".action.toggle-column-tabbed-display = {};

      # --- Screenshots ---
      "Mod+S".action.screenshot = {};
      "Mod+Shift+S".action.screenshot-screen = {};
      "Mod+Shift+W".action.screenshot-window = {};

      # --- Noctalia Shell ---
      "Mod+A" = {
        action.spawn-sh = "${noctaliaExec} ipc call launcher toggle";
        hotkey-overlay.title = "Noctalia: Launcher";
      };

      "Mod+V" = {
        action.spawn-sh = "${noctaliaExec} ipc call launcher clipboard";
        hotkey-overlay.title = "Noctalia: Clipboard";
      };

      "Mod+C" = {
        action.spawn-sh = "${noctaliaExec} ipc call calendar toggle";
        hotkey-overlay.title = "Noctalia: Calendar";
      };

      "Mod+X" = {
        action.spawn-sh = "${noctaliaExec} ipc call sessionMenu toggle";
        hotkey-overlay.title = "Noctalia: Session Menu";
      };

      "Mod+M" = {
        action.spawn-sh = "${noctaliaExec} ipc call systemMonitor toggle";
        hotkey-overlay.title = "Noctalia: System Monitor";
      };

      "Mod+Comma" = {
        action.spawn-sh = "${noctaliaExec} ipc call settings open";
        hotkey-overlay.title = "Noctalia: Settings";
      };

      "Mod+D".action.spawn-sh = self.mkMenu pkgs [
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
  };
}
