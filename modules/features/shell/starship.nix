{
  flake.modules.homeManager.starship = {
    config,
    lib,
    ...
  }: let
    lang = icon: color: {
      symbol = icon;
      format = "[$symbol](${color})";
    };
    os = icon: color: "[${icon} ](${color})";
  in {
    programs.starship = {
      enable = true;
      enableNushellIntegration = true;
      settings = {
        add_newline = true;

        command_timeout = 10000;
        scan_timeout = 10000;

        line_break = {
          disabled = false;
        };

        format = lib.strings.concatStrings [
          "$nix_shell"
          "$os"
          "$directory"
          "$git_branch$git_status$git_state$git_commit"
          "$python"
          "$nodejs"
          "$lua"
          " $cmd_duration"
          "$line_break"
          "$character"
        ];

        character = {
          error_symbol = "[](bold red)";
          success_symbol = "[](bold green)";
          vimcmd_symbol = "[](bold green)";
        };

        cmd_duration = {
          min_time = 1000;
          format = "took [$duration]($style)";
        };

        # GIT
        git_branch = {
          format = " [$symbol$branch]($style) ";
          symbol = " ";
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
          ahead = "";
          behind = "[\${count}](bold dimmed blue)";
          diverged = "\${ahead_count}\${behind_count}";
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

        os = {
          disabled = false;
          format = "$symbol";
        };

        os.symbols = {
          Arch = os "" "bright-blue";
          NixOS = os "" "bright-blue";
        };

        python = lang " " "yellow";
        nodejs = lang " " "blue";
        lua = lang " " "bright-blue";
        bun = lang " " "blue";
        deno = lang " " "blue";
      };
    };
  };
}
