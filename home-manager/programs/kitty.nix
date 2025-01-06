{userConfig, ...}: {
  programs.kitty.enable = userConfig.terminal.kitty.enable;
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
    # background_opacity = "0.8";
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
}
