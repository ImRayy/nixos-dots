{
  flake.modules.nixos.ai = {pkgs, ...}: {
    services.ollama = {
      enable = true;
      package = pkgs.ollama-cuda;
    };

    environment.systemPackages = with pkgs; [
      llama-cpp-vulkan
    ];
  };
}
