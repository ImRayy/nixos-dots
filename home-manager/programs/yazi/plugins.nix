{
  pkgs,
  config,
  ...
}: let
  gh-common = "https://raw.githubusercontent.com";
  yazi-rs-common = "${gh-common}/yazi-rs/plugins/refs/heads/main";
  myrepo = "${gh-common}/ImRayy/doftiles/refs/heads/master/.config/yazi/plugins";

  setwall = pkgs.fetchurl {
    url = "${myrepo}/set-wall.yazi/init.lua";
    sha256 = "1ivswqjfyrir4vjwv9v4fvzridmh08j8p4kw5yn9z19qq292dh08";
  };

  compress = pkgs.fetchurl {
    url = "${gh-common}/KKV9/compress.yazi/refs/heads/main/init.lua";
    sha256 = "0yhg6nvp31k4r6wb8lxqs78cjy34y18a2rhsa9na9r67v5fygw3s";
  };

  smartFilter = pkgs.fetchurl {
    url = "${yazi-rs-common}/smart-filter.yazi/init.lua";
    sha256 = "1k8m4d49cm1ivs4byq7qk1sk5iyqm1rqbl4k53w89yjz6c07886s";
  };

  chmod = pkgs.fetchurl {
    url = "${yazi-rs-common}/chmod.yazi/init.lua";
    sha256 = "1kg392hacj1n3d195akxvymap0wsgymhhz7mnr0yv4c37hs9wcq6";
  };

  max-preview = pkgs.fetchurl {
    url = "${yazi-rs-common}/max-preview.yazi/init.lua";
    sha256 = "0f7h2k00r90xg130ckfpdxfjmkha92ac3nk70k4wb0v5qx4sidlr";
  };

  targetDir = "${config.home.homeDirectory}/.config/yazi/plugins";
in {
  xdg.configFile = {
    "${targetDir}/set-wall.yazi/init.lua".source = setwall;
    "${targetDir}/compress.yazi/init.lua".source = compress;
    "${targetDir}/smart-filter.yazi/init.lua".source = smartFilter;
    "${targetDir}/chmod.yazi/init.lua".source = chmod;
    "${targetDir}/max-preview.yazi/init.lua".source = max-preview;
  };

  programs.yazi.keymap.manager.prepend_keymap = [
    {
      on = ["<A-w>"];
      run = "plugin set-wall";
      desc = "My own wallpaper plugin, which utilizes swww & hyprpaper";
    }
    {
      on = ["c" "a"];
      run = "plugin compress";
    }
    {
      on = ["c" "m"];
      run = "plugin chmod";
    }
    {
      on = "F";
      run = "plugin smart-filter";
    }
    {
      on = ["<C-p>"];
      run = "plugin max-preview";
    }
  ];
}
