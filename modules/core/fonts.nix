{
  flake.modules.nixos.core = {pkgs, ...}: {
    fonts = {
      fontDir.enable = true;
      fontconfig.enable = true;
      packages = with pkgs; [
        roboto
        roboto-serif
        cantarell-fonts
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-color-emoji
        noto-fonts-cjk-sans
        noto-fonts-cjk-serif
        noto-fonts
        dejavu_fonts
        liberation_ttf
        inter
        nerd-fonts.jetbrains-mono
        nerd-fonts.blex-mono
        nerd-fonts.lilex
      ];
    };
  };
}
