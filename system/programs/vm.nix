{
  lib,
  config,
  ...
}: {
  options.vm = {
    enable = lib.mkEnableOption "Virt Manager/KVM Stuff";
  };

  config = lib.mkIf config.vm.enable {
    virtualisation.libvirtd.enable = true;
    programs = {
      dconf.enable = true;
      virt-manager.enable = true;
    };
  };
}
