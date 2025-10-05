{pkgs, ...}: {
  imports = [
    ./fish.nix
    ./starship.nix
    ./zsh.nix
  ];

  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    defaultOptions = [
      "--height 40%"
      "--border"
    ];
    defaultCommand = "fd --type f --strip-cwd-prefix";
    changeDirWidgetCommand = "fd --type directory --hidden";
    fileWidgetOptions = [
      "--preview 'bat --style=numbers --color=always --line-range :42 {}'"
    ];
    changeDirWidgetOptions = [
      "--preview '${pkgs.eza}/bin/eza --tree {} | head -200'"
    ];
  };

  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    enableZshIntegration = true;
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.atuin = {
    enable = true;
    enableFishIntegration = true;
    flags = ["--disable-up-arrow"];
    settings = {
      style = "compact";
      show_help = false;
      inline_height = 14;
      invert = true;
      sync.records = true;
    };
  };

  programs.zellij = {
    enable = true;
  };
}
