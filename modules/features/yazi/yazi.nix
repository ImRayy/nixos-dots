{
  flake.modules.homeManager.yazi = {
    config,
    inputs,
    pkgs,
    ...
  }: {
    home.packages = with pkgs; [
      ffmpeg
      trash-cli
      exiftool
    ];

    programs.yazi = {
      enable = true;
      enableZshIntegration = true;
      package = inputs.yazi.packages.${pkgs.stdenv.hostPlatform.system}.default;
      keymap.mgr.prepend_keymap = [
        {
          on = ["<A-p>"];
          run = "cd ${config.home.homeDirectory}/Pictures";
        }
      ];
      # theme = lib.mkForce (
      #   with config.lib.stylix.colors; {
      #     mode = {
      #       normal_main = {
      #         fg = "#${base00}";
      #         bg = "#${base0D}";
      #         bold = true;
      #       };
      #       normal_alt = {
      #         fg = "#${base0D}";
      #         bg = "#${base01}";
      #       };
      #       select_main = {
      #         fg = "#${base00}";
      #         bg = "#${base0B}";
      #         bold = true;
      #       };
      #       select_alt = {
      #         fg = "#${base0B}";
      #         bg = "#${base01}";
      #       };
      #       unset_main = {
      #         fg = "#${base00}";
      #         bg = "#${base06}";
      #         bold = true;
      #       };
      #       unset_alt = {
      #         fg = "#${base0D}";
      #         bg = "#${base01}";
      #       };
      #     };
      #
      #     mgr = {
      #       border_style = {fg = "#${base03}";};
      #     };
      #   }
      # );
    };
  };
}
