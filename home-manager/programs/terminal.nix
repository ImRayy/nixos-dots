{
  lib,
  config,
  ...
}: let
  shell = config.home.sessionVariables.SHELL;
in {
  options.terminal = lib.mkOption {
    type = lib.types.enum ["foot" "kitty" "ghostty"];
    default = "foot";
    example = "kitty";
    description = lib.mdDoc "Default terminal emulator to use system-wide";
  };

  config = {
    programs = {
      kitty.enable = lib.mkIf (config.terminal == "kitty") true;
      foot.enable = lib.mkIf (config.terminal == "foot") true;
      ghostty.enable = lib.mkIf (config.terminal == "ghostty") true;
    };

    programs.kitty.settings = {
      # Fonts
      bold_font = "auto";
      font_size = "12.5";
      adjust_line_height = 0;
      adjust_column_width = 0;

      # Cursor customization
      cursor_shape = "beam";

      # Scrollback
      scrollback_lines = 2000;

      # Mouse
      url_style = "single";

      # Terminal bell
      enable_audio_bell = "yes";

      # Window layout
      remember_window_size = "no";
      initial_window_width = 1000;
      initial_window_height = 650;
      window_margin_width = 8;
      window_padding_width = 8;
      hide_window_decorations = "no";

      # Tab bar
      tab_bar_edge = "bottom";

      # Color scheme
      dynamic_background_opacity = "yes";

      # Advanced
      allow_remote_control = "yes";
      listen_on = "unix:/tmp/mykitty";
    };

    programs.kitty.keybindings = {
      # Tab management
      "kitty_mod+h" = "previous_tab";
      "kitty_mod+l" = "next_tab";
      "kitty_mod+t" = "new_tab";
      "kitty_mod+q" = "close_tab";
      "kitty_mod+." = "move_tab_forward";
      "kitty_mod+," = "move_tab_backward";
      "kitty_mod+alt+t" = "set_tab_title";
      "ctrl+1" = "goto_tab 1";
      "ctrl+2" = "goto_tab 2";
      "ctrl+3" = "goto_tab 3";
      "ctrl+4" = "goto_tab 4";
      "ctrl+5" = "goto_tab 5";

      # Font sizes
      "kitty_mod+backspace" = "change_font_size  10";
    };

    programs.foot.settings = {
      main = {
        inherit shell;
        font = lib.mkForce (
          "${config.stylix.fonts.monospace.name}:size=12.5"
          + ":fontfeatures=calt"
          + ":fontfeatures=dlig"
          + ":fontfeatures=liga,termicons:size=12"
        );
        line-height = 16.5;
        term = "xterm-256color";
        selection-target = "clipboard";
        dpi-aware = "no";
        pad = "12x12 center";
      };

      cursor = {
        style = "beam";
        blink = "yes";
      };

      desktop-notifications = {
        command = "notify-send -a \${app-id} -i \${app-id} \${title} \${body}";
      };

      bell = {
        command = "notify-send bell";
        command-focused = "no";
        notify = "yes";
        urgent = "yes";
      };
    };

    programs.ghostty = {
      enableFishIntegration = true;
      installBatSyntax = true;
      installVimSyntax = true;
    };

    programs.ghostty.settings = {
      window-padding-x = 10;
      window-padding-y = 10;
      window-padding-balance = true;
      desktop-notifications = true;
    };

    programs.ghostty.settings.keybind = [
      "ctrl+o=toggle_tab_overview"
      "ctrl+k=goto_split:top"
      "ctrl+j=goto_split:bottom"
      "ctrl+l=goto_split:right"
      "ctrl+h=goto_split:left"
    ];
  };
}
