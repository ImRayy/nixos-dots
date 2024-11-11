{pkgs, ...}: {
  programs.mpv = {
    enable = true;
    scripts = with pkgs.mpvScripts; [
      thumbfast
      mpris
      # modernx
    ];
    bindings = {
      "ALT+k" = "add sub-scale +0.1";
      "ALT+j" = "add sub-scale -0.1";
    };
    config = {
      hwdec = "auto-safe";
      osc = false;
      border = false;
      sub-auto = "all";
      save-position-on-quit = true;
    };
  };
}
