{ config, ... }:
with config.lib.stylix.colors;
{
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
      border-radius: 0;
    }

    tooltip {
      background: @base;
      border-color: @crust;
      border-style: solid;
      border-width: 2px;
    }

    #tray,
    #window {
      margin: 4px 4px 4px 0;
      padding: 0px 9px;
      font-weight: 600;
    }

    #custom-distro {
      color: @color3;
      font-size: 16px; 
      margin-right: 14px;
      margin-left: 8px;
    }

    #workspaces {
      margin: 4px 10px 4px 0;
      padding-right: 6px;
      background: @crust;
      border-radius: 6px;
    }

    #workspaces :nth-child(5) {
      margin-right: 0px;
    }

    window#waybar .empty {
        color: @color9;
    }

    #workspaces button {
      color: @color5;
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
      background: transparent;
      color: @color4;
    }

    #workspaces button:hover {
      background: transparent;
      color: @color7;
    }

    #window {
      background: transparent;
    }


    #custom-memory-icon,
    #custom-cpu-icon,
    #custom-flatpak-icon,
    #mpris.icon,
    #network.icon,
    #pulseaudio.icon,
    #custom-clock-icon {
      padding-right: 8px;
    }


    #cpu,
    #memory,
    #custom-flatpak-value,
    #mpris.value,
    #network.value,
    #pulseaudio.value,
    #clock {
      color: @color1;
      padding-right: 14px;
      font-weight: 600;
    }

    #custom-cpu-icon {
      color: @colorA;
    }

    #custom-memory-icon {
      color: @color10;
    }

    #custom-flatpak-icon {
      color: @color5;
    }

    #network.icon {
      color: @color3;
    }

    #pulseaudio.icon {
      color: @color5;
    }

    #custom-clock-icon {
      padding-right: 10px;
      color: @color6;
    }

    #mpris.icon {
      color: @color1;
    }

    #mpris.icon.brave {
      color: @color7;
    }

    #mpris.icon.spotify {
      color: @color5;
    }

    #mpris.icon.firefox {
      color: @color6;
    }

    #mpris.icon.mpv {
      color: @color10;
    }

    #custom-powermenu {
      color: @color4;
      font-size: 15px; 
      margin-right: 4px;
      padding-right: 0;
    }
  '';
}
