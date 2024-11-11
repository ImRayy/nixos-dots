{
  lib,
  pkgs,
  userConfig,
  ...
}: {
  config = lib.mkIf userConfig.terminal.foot.enable {
    home.packages = [pkgs.libsixel];
    programs.foot.enable = true;
    programs.foot.settings = {
      main = {
        font = lib.mkForce "CommitMono Nerd Font:size=12.5:fontfeatures=calt:fontfeatures=dlig:fontfeatures=liga,termicons:size=12";
        line-height = 13.5;
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
  };
}
