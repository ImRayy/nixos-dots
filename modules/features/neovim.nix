{
  flake.modules.homeManager.neovim = {pkgs, ...}: {
    programs.neovim = {
      enable = true;
      withNodeJs = true;
      withPython3 = true;
      viAlias = true;
      vimAlias = true;
      defaultEditor = true;

      initLua = ''
        require("config.lazy")
      '';

      extraPackages = with pkgs; [
        nixd
        alejandra
      ];
    };

    home.packages = with pkgs; [
      gcc
      neovide
      ripgrep
      wordnet
      fd
    ];
  };
}
