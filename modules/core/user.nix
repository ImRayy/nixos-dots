{
  flake.modules.nixos.core = {lib, ...}: {
    options.preferences = {
      username = lib.mkOption {
        type = lib.types.str;
        default = "ray";
      };
    };
  };

  flake.preferences = {
    username = "ray";
  };
}
