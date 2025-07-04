{pkgs, ...}: {
  fonts = {
    fontDir.enable = true;
    fontconfig.enable = true;
    packages = with pkgs; [
      cantarell-fonts
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-extra
      dejavu_fonts
      liberation_ttf
      nerd-fonts.commit-mono
      nerd-fonts.jetbrains-mono
      nerd-fonts.zed-mono
    ];
  };
}
