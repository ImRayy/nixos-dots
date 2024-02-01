{ config, ... }:
{
    xdg.configFile."neofetch/config.conf".source = ./config.conf;
}
