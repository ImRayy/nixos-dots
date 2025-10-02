{config, ...}: {
  imports = [
    # ./rofi
    ./dunst.nix
    ./gtk.nix
    ./hypr
    ./mpv.nix
    ./neofetch.nix
    ./neovim.nix
    ./pass.nix
    ./qtile.nix
    ./quickshell.nix
    ./shell
    ./terminal.nix
    ./yazi/yazi.nix
  ];

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep 5 --keep-since 3d";
    flake = "${config.home.homeDirectory}/.nixos-dots";
  };
}
