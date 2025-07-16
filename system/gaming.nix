{pkgs, ...}: {
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  environment.systemPackages = with pkgs; [
    mangohud
    protonup
    lutris
    heroic
    bottles
  ];

  programs.gamemode.enable = true;
  programs.gamescope.enable = true;
}
