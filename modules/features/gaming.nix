{
  flake.modules.nixos.gaming = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      mangohud
      protonup-ng
      lutris
      heroic
      winetricks
      protontricks
      wineWowPackages.wayland
    ];

    programs.gamemode = {
      enable = true;
      settings = {
        general = {
          softrealtime = "auto";
          renince = 15;
        };
      };
    };

    programs.gamescope = {
      enable = true;
      capSysNice = true;
      args = [
        "--rt"
        "--expose-wayland"
      ];
    };

    programs.steam = {
      enable = true;

      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];

      gamescopeSession.enable = true;
    };
  };
}
