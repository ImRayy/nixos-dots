{ config, ... }:
with config.lib.stylix.colors; {
    programs.waybar.style = ''
        @define-color base      #${base00};
        @define-color crust     #${base01};

        @define-color color0    #${base05};
        @define-color color1    @color0;
        @define-color color2    #${base07};
        @define-color color3    @color0;
        @define-color color4    #${base08};
        @define-color color5    @color0;
        @define-color color6    @color0;
        @define-color color7    @color0;
        @define-color color8    #${base01};
        @define-color color9    @color0;

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
        #window,
        #mpris,
        #workspaces {
          font-weight: 600;
          margin: 6px 0 6px 0;
          padding: 0 14px;
        }

        #tray {
          padding-right: 10px;
          border-right: 2px solid @crust;
        }

        #workspaces {
          font-weight: Bold;
          padding: 1px 0;
          margin: 4px 4px;
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

        #cpu,
        #memory {
          color: @color1;
        }

        #cpu {
          padding-right: 14px;
          border-left: 2px solid @crust;
          border-right: 2px solid @crust;
        }

        #mpris {
          color: @color7;
        }

        #clock {
          color: @color6;
          font-weight: 600;
        }

        #custom-swaync {
          color: @color1;
          padding-right: 18px;
        }

        #network {
          color: @color3;
          border-right: 2px solid @crust;
        }

        #pulseaudio {
          color: @color5;
          border-right: 2px solid @crust;
        }
    '';
}
