{ pkgs, username, ... }:

{
  wayland.windowManager.hyprland = {
    extraConfig =
      let
        screenshot_path = "/home/${username}/Pictures/screenshots";
        hyprshot = pkgs.writeShellScriptBin "hyprshot.sh" ''
          if [[ ! -d ${screenshot_path} ]];then
            mkdir -p ${screenshot_path}
          fi

          ${pkgs.hyprshot}/bin/hyprshot -m region --output-folder ${screenshot_path}
        '';
      in
      ''
        # Screenshot
        bind = ALT, S, exec, ${hyprshot}/bin/hyprshot.sh
      '';
  };
}
