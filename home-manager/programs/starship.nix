{
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;

      line_break = { disabled = true; };

      character = {
        error_symbol = " [](bold red)";
        success_symbol = " [❯](bold green)";
        vimcmd_symbol = " [❮](bold green)";
      };

      cmd_duration = {
        min_time = 1000;
        format = " took [$duration]($style)";
      };

      directory = {
        truncation_length = 5;
        truncation_symbol = " ";
        format = "[$path]($style)[$read_only]($read_only_style)";
        read_only = "󰌾 ";
        style = "bold cyan";
      };

      directory.substitutions = {
        Documents = "󰈔 ";
        Downloads = " ";
        Music = "󰎈 ";
        Pictures = "󰋩 ";
        Videos = " ";
      };

      # GIT
      git_branch = {
        format = " [$symbol$branch]($style) ";
        symbol = "🍣 ";
        style = "bold green";
        always_show_remote = false;
        only_attached = false;
        disabled = false;
      };

      git_state = {
        format = "[($state( $progress_current of $progress_total))]($style) ";
        style = "bold yellow";
      };

      git_status = {
        conflicted = "⚔️ ";
        ahead = "⇡";
        behind = "[⇣\${count}](bold dimmed blue)";
        diverged = "⇕\${ahead_count}⇣\${behind_count}";
        untracked = "[?\${count}](bold blue)";
        modified = "[!\${count}](bold yellow)";
        staged = "[+\${count}](bold yellow)";
        renamed = "» ×\${count}";
        deleted = "[✘ ×\${count}](bold red)";
        format = "$all_status$ahead_behind";
      };

      git_commit = {
        commit_hash_length = 4;
        style = "bold white";
        tag_symbol = " 🏷 ";
      };

      memory_usage = {
        format = "$symbol[\${ram}( | \${swap})]($style) ";
        threshold = 70;
        style = "bold dimmed white";
        disabled = false;
      };

      # Programming Languages
      python = {
        format = "[$symbol$version](bold ) ";
        symbol = "  ";
      };

      lua = {
        format = "[$symbol($version )]($style)";
        detect_extensions = [ "lua" ];
        symbol = "  ";
        style = "bold cyan";
      };

      nodejs = {
        format = "[$symbol($version )]($style)";
        detect_extensions = [ "ts" "mts" "cts" "ts" "mts" "cts" ];
        symbol = "  ";
        style = "bold #8FC708";
      };

      custom.nix = {
        format = "[$symbol($version )]($style)";
        detect_extensions = [ "nix" ];
        symbol = "  ";
        style = "bold #B2D3FF";
      };
    };
  };
}
