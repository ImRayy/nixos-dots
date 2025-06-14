{
  config,
  inputs,
  pkgs,
  ...
}: {
  imports = [./plugins.nix];

  programs.yazi = {
    enableFishIntegration = true;
    enable = true;
    package = inputs.yazi.packages.${pkgs.system}.default;
    settings = {
      enableBashIntegration = true;
      log.enabled = false;
      preview.max_width = 1000;
      mgr = {
        sort_dir_first = true;
        linemode = "size";
        show_symlink = true;
        show_hidden = false;
      };
      plugin.prepend_previewers = [
        {
          mime = "audio/*";
          run = "exifaudio";
        }
      ];
    };
    keymap.mgr.prepend_keymap = [
      {
        on = ["<A-p>"];
        run = "cd ${config.home.homeDirectory}/Pictures";
      }
    ];
    theme = with config.lib.stylix.colors; {
      mode = {
        normal_main = {
          fg = "#${base00}";
          bg = "#${base0D}";
          bold = true;
        };
        normal_alt = {
          fg = "#${base0D}";
          bg = "#${base01}";
        };
        select_main = {
          fg = "#${base00}";
          bg = "#${base0B}";
          bold = true;
        };
        select_alt = {
          fg = "#${base0B}";
          bg = "#${base01}";
        };
        unset_main = {
          fg = "#${base00}";
          bg = "#${base06}";
          bold = true;
        };
        unset_alt = {
          fg = "#${base0D}";
          bg = "#${base01}";
        };
      };

      mgr = {
        border_style = {fg = "#${base03}";};
      };
    };
  };
}
