{
  flake.modules.homeManager.anythingelse = {
    pkgs,
    config,
    ...
  }: let
    gh-common = "https://raw.githubusercontent.com";
    yazi-rs-common = "${gh-common}/yazi-rs/plugins/refs/heads/main";
    targetDir = "${config.home.homeDirectory}/.config/yazi/plugins";

    compress = pkgs.fetchurl {
      url = "${gh-common}/KKV9/compress.yazi/refs/heads/main/main.lua";
      sha256 = "041wk9n56fdz0mg5zwjc0faf5l4x9cz119a6icab4m72bzswf32f";
    };

    chmod = pkgs.fetchurl {
      url = "${yazi-rs-common}/chmod.yazi/main.lua";
      sha256 = "0s4gscnq529lg9r1b7nsrssc02g5hhq3fjmlzjzzpbdqn7js22m1";
    };

    mount = pkgs.fetchurl {
      url = "${yazi-rs-common}/mount.yazi/main.lua";
      sha256 = "0ajs6md0b8ir16aa5xid7c14lza0fyjficwrb5z2rssfmxldvjng";
    };
  in {
    xdg.configFile = {
      "${targetDir}/compress.yazi/main.lua".source = compress;
      "${targetDir}/chmod.yazi/main.lua".source = chmod;
      "${targetDir}/mount.yazi/main.lua".source = mount;
    };

    programs.yazi.keymap.mgr.prepend_keymap = [
      # Set wall
      {
        on = ["<A-w>"];
        run = "plugin set-wall";
        desc = "My own wallpaper plugin, which utilizes swww & hyprpaper";
      }

      # Compress
      {
        on = ["c" "a" "a"];
        run = "plugin compress";
        desc = "Archive selected files";
      }
      {
        on = ["c" "a" "p"];
        run = "plugin compress -p";
        desc = "Archive selected files (password)";
      }
      {
        on = ["c" "a" "h"];
        run = "plugin compress -ph";
        desc = "Archive selected files (password+header)";
      }
      {
        on = ["c" "a" "l"];
        run = "plugin compress -l";
        desc = "Archive selected files (compression level)";
      }
      {
        on = ["c" "a" "u"];
        run = "plugin compress -phl";
        desc = "Archive selected files (password+header+level)";
      }

      # Chmod
      {
        on = ["c" "m"];
        run = "plugin chmod";
      }

      # Mount
      {
        on = "M";
        run = "plugin mount";
      }
    ];
  };
}
