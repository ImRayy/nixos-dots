{pkgs, ...}: {
  imports = [
    ./fish.nix
    ./starship.nix
  ];

  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
    enableBashIntegration = true;
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
    enableFishIntegration = true;
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
