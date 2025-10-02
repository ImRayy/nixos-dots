{
  pkgs,
  unstablePkgs,
  inputs,
  system,
  ...
}: {
  boot.tmp.useTmpfs = true;
  boot.tmp.tmpfsSize = "30%";
  boot.loader = {
    systemd-boot.enable = false;
    timeout = 60;
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
    grub = {
      devices = ["nodev"];
      enable = true;
      efiSupport = true;
      useOSProber = true;
      gfxmodeEfi = "1920x1080";
      theme = inputs.distro-grub-themes.packages.${system}.nixos-grub-theme;
    };
  };
  boot.plymouth = {
    enable = true;
    theme = "cuts_alt";
    themePackages = with pkgs; [
      (adi1090x-plymouth-themes.override {
        # source: https://github.com/adi1090x/plymouth-themes
        selected_themes = ["cuts_alt"];
      })
    ];
  };
  boot.supportedFilesystems = ["ntfs"];
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.consoleLogLevel = 0;
  boot.initrd.verbose = false;
  boot.kernelParams = [
    "nvidia-drm.modeset=1"
    # "nvidia-drm.fbdev=1"
    "quiet"
    "splash"
    "loglevel=3"
    "boot.shell_on_fail"
    "rd.systemd.show_status=false"
    "rd.udev.log_level=3"
    "udev.log_priority=3"
  ];
}
