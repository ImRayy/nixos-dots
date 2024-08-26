{ config, pkgs, ... }:

{
  imports = [
    ./dunst.nix
    ./fish
    ./fzf.nix
    ./gtk.nix
    ./hypr
    ./kitty.nix
    ./lf
    ./misc.nix
    ./mpv.nix
    ./neofetch
    # FIXME: Qtile is broken for now
    # ./qtile.nix
    ./rofi
    ./starship.nix
    ./waybar
  ];
}
