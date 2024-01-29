{ config, pkgs, ... }:

{
    environment.systemPackages = with pkgs; [ swaylock ];
    security.pam.services.swaylock = {}; 
}
