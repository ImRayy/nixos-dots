{ config, pkgs,  ... }:

{
  networking.firewall.allowedTCPPorts = [ 8384 22000 1714 ];
  networking.firewall.allowedUDPPorts = [ 22000 21027 1764];
  networking.firewall.enable = true;
}
