{inputs, ...}: {
  flake.modules.nixos.llm-agents = {pkgs, ...}: let
    llms = inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system};
  in {
    environment.systemPackages = with llms; [
      pi
    ];
  };
}
