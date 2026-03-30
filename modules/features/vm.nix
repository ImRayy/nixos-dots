{
  flake.modules.nixos.vm = {
    virtualisation.libvirtd.enable = true;
    programs = {
      dconf.enable = true;
      virt-manager.enable = true;
    };
  };
}
