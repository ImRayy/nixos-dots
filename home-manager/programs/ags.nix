{ lib, config, inputs, pkgs, systemConfig, homeConfig, ... }:

let
    wm = systemConfig.windowManager;
    hyprlandEnabled = wm == "hyprland" || wm == "all";
    enabled = lib.mkIf (hyprlandEnabled && homeConfig.statusBar == "ags");
in
{
    imports = [ inputs.ags.homeManagerModules.default ];

    programs.ags = enabled {
        enable = true;
        # configDir = ../ags;
        extraPackages = with pkgs; [
            accountsservice
        ];
    };

    xdg.configFile = enabled {
        "ags" = {
            source = ../ags;
            recursive = true;
        };

        "ags/style/colors.scss" = with config.lib.stylix.colors; {
            source = pkgs.writeText "ags-colors" ''
                $base:    #${base00};
                $crust:   #${base01};
                $color00: #${base05};
                $color01: #${base07};
                $color02: #${base07};
                $color03: #${base0D};
                $color04: #${base08};
                $color05: #${base0B};
                $color06: #${base09};
                $color07: #${base0A};
                $color08: #${base01};
                $color09: #${base05};
                $color10: #${base0E};
                $color11: #${base0C};
            '';
        };
    };
}
