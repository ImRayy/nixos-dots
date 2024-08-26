{ config, pkgs, ... }:

{
  programs.fzf = {
    enable = true;
    defaultOptions = [
      "--height 40%"
      "--border"
    ];
    defaultCommand = "fd --type f --strip-cwd-prefix";
    fileWidgetOptions = [ "--preview 'bat --style=numbers --color=always --line-range :42 {}'" ];
    changeDirWidgetOptions = [ "--preview 'tree -C {} | head -200'" ];
    colors = with config.lib.stylix.colors; {
      spinner = "#${base06}";
      hl = "#${base08}";
      fg = "#${base05}";
      header = "#${base08}";
      info = "#${base07}";
      pointer = "#${base06}";
      marker = "#${base06}";
      "fg+" = "#${base05}";
      prompt = "#${base07}";
      "hl+" = "#${base08}";

    };
  };
}
