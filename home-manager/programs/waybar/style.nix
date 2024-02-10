{ config, ... }:
with config.lib.stylix.colors; {
    programs.waybar.style = ''
        @define-color base      #${base00};
        @define-color crust     #${base01};

        @define-color color0    #${base05};
        @define-color color1    #${base07};
        @define-color color2    #${base07};
        @define-color color3    #${base0D};
        @define-color color4    #${base08};
        @define-color color5    #${base0B};
        @define-color color6    #${base09};
        @define-color color7    #${base0A};
        @define-color color8    #${base01};
        @define-color color9    @color0;
        @define-color color10   #${base0E};
        @define-color colorA    #${base0C};

        * {
          border: none;
          font-family: CommitMono Nerd Font;
          font-size: 14px;
          min-height: 0;
          padding: 0 0.6px;
        }

        window#waybar {
          background: @base;
          color: @color8;
          border-radius: 6px;
        }

        tooltip {
          background: @base;
          border-color: @crust;
          border-radius: 10px;
          border-style: solid;
          border-width: 2px;
        }

        #backlight,
        #cpu,
        #custom-swaync,
        #memory,
        #network,
        #pulseaudio,
        #tray,
        #clock,
        #custom-powermenu,
        #window,
        #mpris,
        #workspaces {
          margin: 6px 6px 6px 0;
          padding: 0px 9px;
          border-radius: 6px;
          font-weight: 600;
        }

        #custom-distro {
          color: @color3;
          font-size: 18px;
          margin-left: 8px;
        }

        #custom-separator {
            color: #${base04};
        }

        #tray {
          padding-right: 10px;
        }

        #workspaces {
          font-weight: Bold;
          padding-left: 5px; 
          margin-left: 4px;
          padding-right: 0;
        }

        #workspaces :nth-child(5) {
          margin-right: 0px;
        }

        #workspaces button {
          border-radius: 6px;
          color: @color9;
          padding: 6px;
        }

        #workspaces button.active {
          color: @color2;
        }

        #workspaces button.focused {
          background: @color7;
          color: @color8;
        }

        #workspaces button.urgent {
          background: @color4;
          color: @color8;
        }

        #workspaces button:hover {
          background: @crust;
          color: @color7;
        }

        #window {
          background: transparent;
          border-radius: 10px;
        }

        #memory {
          color: @color10;
        }

        #cpu {
          padding-right: 6px;
          color: @colorA;
        }

        #mpris {
          color: @color7;
        }

        #clock {
          color: @color6;
          padding-right: 4px;
        }

        #custom-swaync {
          color: @color1;
          padding-right: 4px;
        }

        #network {
          color: @color3;
        }

        #pulseaudio {
          color: @color5;
        }

        #custom-powermenu {
          color: @color4;
          font-weight: 800;
          font-size: 17px;
          margin-right: 6px;
          padding-right: 0;
        }
    '';
}
