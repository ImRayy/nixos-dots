{ pkgs, ... }:
{
    programs.mpv = {
        enable = true;
        scripts = with pkgs.mpvScripts; [
            thumbnail
            mpris
        ];
        bindings = {
            "ALT+k" = "add sub-scale +0.1";
            "ALT+j" = "add sub-scale -0.1";
            "j" = "seek -10";
            "l" = "seek 10";
        };
        config = {
            osc = false;
            sub-auto = "all";
            save-position-on-quit = true;
        };
    }; 
}
