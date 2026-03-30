{
  flake.modules.nixos.niri = {pkgs, ...}: {
    programs.niri.enable = true;

    environment.systemPackages = with pkgs; [
      loupe
      wl-clipboard
      wf-recorder
    ];
  };
}
