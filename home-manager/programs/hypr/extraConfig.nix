{ pkgs, inputs, ... }:
{
    home.packages = with pkgs; [ grim slurp ];
    wayland.windowManager.hyprland = {
        extraConfig = 
            let
                screenshot = pkgs.writeShellScriptBin "screenshot.sh" ''
                    #!/usr/bin/env bash

                    SCREENSHOT_DIR="''${HOME}/Pictures/Screenshots"

                    if ! command -v grim &>/dev/null || ! command -v slurp &>/dev/null; then
                        notify-send "ERROR" "Make sure grim & slurp both installed"
                    else
                        if [[ -d $SCREENSHOT_DIR ]]; then
                            grim -g "$(slurp)" $SCREENSHOT_DIR/"$(date +%Y%m%d-%H%M%S)".png
                        else
                            mkdir -p ''${SCREENSHOT_DIR} &&
                                grim -g "$(slurp)" $SCREENSHOT_DIR/"$(date +%Y%m%d-%H%M%S)".png
                        fi
                    fi
                '';
            in
            ''
                # Screenshot/Screen Recording
                binde = ALT, S, exec, bash -c ${screenshot}/bin/screenshot.sh
            '';
    };
}
