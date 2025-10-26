{
  lib,
  config,
  pkgs,
  ...
}: {
  options.gaming = {
    enable = lib.mkEnableOption "Gaming";
  };

  config = lib.mkIf config.gaming.enable {
    environment.systemPackages = with pkgs; [
      mangohud
      protonup
      lutris
      heroic
      bottles
      cloudflare-warp
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

    systemd.packages = [pkgs.cloudflare-warp]; # for warp-cli
    systemd.targets.multi-user.wants = ["warp-svc.service"]; # causes warp-svc to be started automatically
  };
}
