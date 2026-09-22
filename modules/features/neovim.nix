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
        require("core.lazy")
        require("core.options")
        require("core.keybindings")
        require("core.cmds")
        require("core.gui")
      '';

      extraPackages = with pkgs; [
        nixd
        alejandra
        luarocks
        tree-sitter
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
