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
    sha256 = "1w4ck1mlwyfgm3fqgs3fzax67f87jkbf6yngzvv51a578z4zxmqk";
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

  targetDir = "${config.home.homeDirectory}/.config/yazi/plugins";
in {
  xdg.configFile = {
    "${targetDir}/set-wall.yazi/init.lua".source = setwall;
    "${targetDir}/compress.yazi/init.lua".source = compress;
    "${targetDir}/smart-filter.yazi/init.lua".source = smartFilter;
    "${targetDir}/chmod.yazi/init.lua".source = chmod;
  };
}
