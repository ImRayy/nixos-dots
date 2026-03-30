{
  flake.modules.homeManager.neofetch = {pkgs, ...}: let
    neofetch-image = pkgs.fetchurl {
      url = "https://ik.imagekit.io/rayshold/dotfiles/_config/neofetch/2B.png";
      sha256 = "18rgqabsfkpxgw15yfynavcsk277vax2rw3668i9ici6p7ixjpiy";
    };
  in {
    xdg.configFile."neofetch/config.conf".source = pkgs.writeText "neofetch-config" ''
      print_info() {
          prin "$(color 1)A N I M E | L I N U X"
          prin "──────────────────────"
          prin ""
          info "$(color 1) " users
          info "$(color 2) " distro
          info "$(color 3)󰍹 " de
          info "$(color 4) " shell
          info " " term
          info "$(color 6)󱑀 " uptime
          info "$(color 5) " packages
          info "$(color 7) " memory
          info "$(color 10) " cpu
          info "$(color 9)󰊖 " gpu
          prin ""
          prin ──────────────────────
          prin "$(color 1) $(color 2)  $(color 3)   $(color 4)  $(color 5)  $(color 6)  $(color 7)  $(color 8)  $(color 9)"
      }
      distro_shorthand="tiny"
      os_arch="on"
      package_managers="off"
      image_backend="kitty"
      image_source=${neofetch-image}
      ascii_distro="auto"
      ascii_colors=(distro)
      ascii_bold="on"
      image_loop="on"
      crop_mode="normal"
      crop_offset="center"
      image_size="320px"
      yoffset=0
      xoffset=0
    '';
  };
}
