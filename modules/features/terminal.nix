{
  flake.modules.homeManager.terminal = {
    config,
    pkgs,
    ...
  }: let
    shell = config.home.sessionVariables.SHELL;
  in {
    programs.foot.enable = true;
    programs.foot.settings = {
      main = {
        inherit shell;
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

    home.packages = with pkgs; [chafa];
  };
}
