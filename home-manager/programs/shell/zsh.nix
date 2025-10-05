{
  config,
  pkgs,
  ...
}: let
  home = config.home.homeDirectory;
  paths = [
    ".bun/bin"
    ".local/share/go/bin"
    ".volta/bin"
    "go/bin"
  ];
  pathString = builtins.concatStringsSep ":" (map (x: "${home}/${x}") paths);

  sources = with pkgs; [
    "${zsh-you-should-use}/share/zsh/plugins/you-should-use/you-should-use.plugin.zsh"
    "${zsh-autopair}/share/zsh/zsh-autopair/autopair.zsh"
    "${zsh-vi-mode}/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh"
    "${zsh-history-substring-search}/share/zsh-history-substring-search/zsh-history-substring-search.zsh"
    "${zsh-fzf-tab}/share/fzf-tab/fzf-tab.plugin.zsh"
  ];

  plugins = builtins.concatStringsSep "\n" ([
      "${pkgs.any-nix-shell}/bin/any-nix-shell zsh --info-right | source /dev/stdin"
    ]
    ++ map (file: "source ${file}") sources);
in {
  programs.zsh = {
    enable = true;
    shellAliases = import ./aliases.nix;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    initContent =
      #bash
      ''
        ${plugins}

        setopt HIST_IGNORE_DUPS
        setopt HIST_IGNORE_ALL_DUPS
        setopt HIST_FIND_NO_DUPS
        setopt INC_APPEND_HISTORY
        setopt HIST_EXPIRE_DUPS_FIRST
        setopt EXTENDED_HISTORY
        setopt HIST_REDUCE_BLANKS

        # This will prevent the typed characters from being displayed on the
        # terminal before loading zsh, followed by the % prompt.
        unsetopt PROMPT_SP

        bindkey -e

        # The following lines were added by compinstall
        zstyle :compinstall filename '~/.zshrc'
        autoload -Uz compinit
        compinit

        # Set case sensitive to false like Fish shell
        zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

        # FZF-Tab
        zstyle ':completion:*' menu no
        zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

        # Rebind keys removed by zsh-vi-mode plugin
        function zvm_after_init() {
            # bindkey "^[[A" fzf-history-widget
            # bindkey '^R'   fzf-history-widget
            eval "$(${pkgs.atuin}/bin/atuin init zsh --disable-up-arrow)"
        }
      '';
    envExtra =
      #zsh
      ''
        export PATH="${pathString}:$PATH"
        export ZLE_RPROMPT_INDENT=0
      '';
  };
}
