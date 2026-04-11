{inputs, ...}: {
  imports = [
    inputs.wrapper-modules.flakeModules.wrappers
    inputs.flake-parts.flakeModules.modules
  ];

  config = {
    systems = [
      "x86_64-linux"
    ];
  };
}
