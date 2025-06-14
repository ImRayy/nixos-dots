{
  pkgs,
  config,
  ...
}: let
  gh-common = "https://raw.githubusercontent.com";
  yazi-rs-common = "${gh-common}/yazi-rs/plugins/refs/heads/main";
  myrepo = "${gh-common}/ImRayy/doftiles/refs/heads/master/.config/yazi/plugins";
  targetDir = "${config.home.homeDirectory}/.config/yazi/plugins";

  setwall = pkgs.fetchurl {
    url = "${myrepo}/set-wall.yazi/init.lua";
    sha256 = "1ivswqjfyrir4vjwv9v4fvzridmh08j8p4kw5yn9z19qq292dh08";
  };

  compress = pkgs.fetchurl {
    url = "${gh-common}/KKV9/compress.yazi/refs/heads/main/main.lua";
    sha256 = "071647k0r8kacxkvq12hi1i1di1s49n429dkball86z6y5cvcli5";
  };

  chmod = pkgs.fetchurl {
    url = "${yazi-rs-common}/chmod.yazi/main.lua";
    sha256 = "1n1afi95gklyw6gja14cnnihj3pm93q5a2rn49a302j01n2pg3jh";
  };

  mount = pkgs.fetchurl {
    url = "${yazi-rs-common}/mount.yazi/main.lua";
    sha256 = "0sp799rpid1lhysjgycwxj43x4si6hkmq8m5miszwxav304102v5";
  };

  whatSize = pkgs.fetchurl {
    url = "${gh-common}/pirafrank/what-size.yazi/refs/heads/main/main.lua";
    sha256 = "1v8asln9011x2a4bzwq9prq86vs3jf2n3i68mfnbz27mp86ikkf2";
  };
in {
  xdg.configFile = {
    "${targetDir}/set-wall.yazi/main.lua".source = setwall;
    "${targetDir}/compress.yazi/main.lua".source = compress;
    "${targetDir}/chmod.yazi/main.lua".source = chmod;
    "${targetDir}/mount.yazi/main.lua".source = mount;
    "${targetDir}/what-size.yazi/main.lua".source = whatSize;
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

    # What Size
    {
      on = ["." "s"];
      run = "plugin what-size";
      desc = "Calc size of selection or cwd";
    }
  ];
}
