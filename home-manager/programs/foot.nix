{ lib, pkgs, ... }:

{
  home.packages = [ pkgs.libsixel ];
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = lib.mkForce "CommitMono Nerd Font:size=12.5:fontfeatures=calt:fontfeatures=dlig:fontfeatures=liga,termicons:size=12";
        line-height = 13.5;
        term = "xterm-256color";
        dpi-aware = "no";
        pad = "12x12 center";
      };
      cursor = {
        style = "beam";
        blink = "yes";
      };
    };
  };
}
