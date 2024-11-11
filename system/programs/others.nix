{pkgs, ...}: {
  services.flatpak.enable = true;

  services.ollama = {
    enable = false;
    package = pkgs.ollama;
    acceleration = "cuda";
  };
  programs.adb.enable = true;
}
