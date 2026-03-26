{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    withNodeJs = true;
    withPython3 = true;
    viAlias = true;
    vimAlias = true;

    extraPackages = with pkgs; [
      alejandra
      nixd
    ];
  };

  home.packages = with pkgs; [
    neovide
    ripgrep
    wordnet
    fd
  ];
}
