{
  networking.firewall = rec {
    enable = true;
    allowedTCPPorts = [
      8384
      22000
    ];
    allowedUDPPorts = [
      22000
      21027
    ];
    allowedTCPPortRanges = [
      {
        from = 1714;
        to = 1764;
      }
    ];
    allowedUDPPortRanges = allowedTCPPortRanges;
  };
}
