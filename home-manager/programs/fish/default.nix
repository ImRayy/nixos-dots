{
    programs.fish = {
        enable = true;
        shellInit = ''
            set fish_vi_key_bindings
        '';
        interactiveShellInit = ''
            set fish_greeting
            set TERM "xterm-256color"
        '';
    };

    imports = [
        ./aliases.nix
    ];
}
