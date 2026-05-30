{
  flake.modules.nixos.ai = {pkgs, ...}: {
    services.ollama = {
      enable = true;
      package = pkgs.ollama-vulkan;
    };

    environment.systemPackages = with pkgs; [
      llama-cpp-vulkan
      # ((pkgs.llama-cpp.override {
      #     cudaSupport = true;
      #     rocmSupport = false;
      #     metalSupport = false;
      #     blasSupport = true;
      #   }).overrideAttrs (oldAttrs: {
      #     cmakeFlags =
      #       (oldAttrs.cmakeFlags or [])
      #       ++ [
      #         "-DGGML_NATIVE=ON"
      #       ];
      #
      #     preConfigure = ''
      #       export NIX_ENFORCE_NO_NATIVE=0
      #       ${oldAttrs.preConfigure or ""}
      #     '';
      #   }))
    ];
  };
}
