{
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
    };
  };
}
