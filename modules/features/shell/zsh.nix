{
  flake.modules.nixos.zsh = {
    config,
    pkgs,
    ...
  }: {
    users.users.${config.preferences.username}.shell = pkgs.zsh;

    programs.zsh = {
      enable = true;
      enableGlobalCompInit = false;
    };
  };

  flake.modules.homeManager.zsh = {
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

    sources = with pkgs; [
      "${zsh-you-should-use}/share/zsh/plugins/you-should-use/you-should-use.plugin.zsh"
      "${zsh-autopair}/share/zsh/zsh-autopair/autopair.zsh"
      "${zsh-vi-mode}/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh"
      "${zsh-history-substring-search}/share/zsh-history-substring-search/zsh-history-substring-search.zsh"
      "${zsh-fzf-tab}/share/fzf-tab/fzf-tab.plugin.zsh"
    ];

    # Generate init scripts at build time instead of forking binaries on every shell start
    anyNixShellInit = pkgs.runCommand "any-nix-shell-zsh-init" {} ''
      ${pkgs.any-nix-shell}/bin/any-nix-shell zsh --info-right > $out
    '';

    plugins = builtins.concatStringsSep "\n" ([
        "source ${anyNixShellInit}"
      ]
      ++ map (file: "source ${file}") sources);
  in {
    # Replaces the manual `export PATH=...` in .zshenv (no duplicates in nested shells)
    home.sessionPath = map (x: "${home}/${x}") paths;

    home.sessionVariables = {
      SHELL = "${pkgs.zsh}/bin/zsh";
    };

    programs.zsh = {
      enable = true;
      shellAliases = import ./_aliases.nix;
      enableCompletion = true;

      # -C skips the security check and dump regeneration (much faster).
      # If a new completion doesn't show up, run: rm -f ~/.zcompdump*
      completionInit = "autoload -Uz compinit && compinit -C";

      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      initContent =
        #bash
        ''
          ${plugins}

          setopt HIST_IGNORE_ALL_DUPS
          setopt HIST_FIND_NO_DUPS
          setopt INC_APPEND_HISTORY
          setopt HIST_EXPIRE_DUPS_FIRST
          setopt EXTENDED_HISTORY
          setopt HIST_REDUCE_BLANKS

          # This will prevent the typed characters from being displayed on the
          # terminal before loading zsh, followed by the % prompt.
          unsetopt PROMPT_SP

          # Set case sensitive to false like Fish shell
          zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

          # FZF-Tab
          zstyle ':completion:*' menu no
          zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

          # Rebind keys removed by zsh-vi-mode plugin
          function zvm_after_init() {
              eval "$(${pkgs.atuin}/bin/atuin init zsh --disable-up-arrow)"

              bindkey '^[[A' history-substring-search-up
              bindkey '^[OA' history-substring-search-up
              bindkey '^[[B' history-substring-search-down
              bindkey '^[OB' history-substring-search-down
          }
        '';

      envExtra =
        #zsh
        ''
          export ZLE_RPROMPT_INDENT=0
        '';
    };
  };
}
