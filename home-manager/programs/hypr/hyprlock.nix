{ pkgs, ... }:

{
  programs.hyprlock = {
    enable = true;
    package = pkgs.hyprlock.overrideAttrs (old: {
      version = "git";
      src = pkgs.fetchFromGitHub {
        owner = "hyprwm";
        repo = "hyprlock";
        rev = "2bce52f";
        sha256 = "36qa6MOhCBd39YPC0FgapwGRHZXjstw8BQuKdFzwQ4k=";
      };
      # This fixes hyprlock delay/lag issue on nvidia, huge thanks to IOKernel
      # https://github.com/hyprwm/hyprlock/issues/128#issuecomment-2063629880
      patchPhase = ''
        substituteInPlace src/core/hyprlock.cpp \
        --replace "5000" "16"
      '';
    });
  };
}
