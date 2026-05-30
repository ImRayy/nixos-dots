{
  flake.modules.nixos.neovim = {
    environment.variables = {
      EDITOR = "nvim";
    };
  };

  flake.modules.homeManager.neovim = {pkgs, ...}: {
    home.packages = with pkgs; [
      neovim
      nixd
      alejandra
      gcc
      neovide
      ripgrep
      wordnet
      fd
    ];
  };
}
