{config, ...}: {
  imports = [
    # ./dunst.nix
    ./gtk.nix
    ./hypr
    ./mpv.nix
    ./neofetch.nix
    ./neovim.nix
    ./niri
    ./pass.nix
    ./quickshell.nix
    ./shell
    ./terminal.nix
    ./yazi/yazi.nix
    ./obs-studio.nix
    ./lazy-git.nix
  ];

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep 5 --keep-since 3d";
    flake = "${config.home.homeDirectory}/.nixos-dots";
  };
}
