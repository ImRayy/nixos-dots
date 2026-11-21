{
  flake.modules.nixos.core = {pkgs, ...}: {
    fonts = {
      fontDir.enable = true;
      fontconfig.enable = true;
      packages = with pkgs; [
        roboto
        cantarell-fonts
        noto-fonts
        noto-fonts-color-emoji
        noto-fonts-cjk-sans
        dejavu_fonts
        liberation_ttf
        nerd-fonts.jetbrains-mono
      ];
    };
  };
}
