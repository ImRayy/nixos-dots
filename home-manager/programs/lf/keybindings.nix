{ config, ... }:
{
    programs.lf.keybindings = {
        # Empty Bindings
        c = "";
        d = "";
        f = "";
        m = "";
        n = "";

        # Basic Functions
        "." = "set hidden!";
        p = "paste";
        x = "cut";
        y = "copy";
        mf = "mkfile";
        md = "mkdir";
        ch = "chmod";
        r = "rename";
        br = "$vimv $fx";
        C = "clear";
        U = "unselect";
        O = "push :open-with-gui<space>"; 
        o = "push :open-with-cli<space>"; 

        # Archive Mapping
        az = "zip";
        at = "tar";
        ag = "targz";
        au = "unarchive";

        # Bookmarks
        bc = "bookmark_create";
        bj = "bookmark_jump";

        # Key Bindings
        "<esc>" = "cmd-escape";
        e = "$$EDITOR $fx";
        D = "delete";
        "<c-y>" = "up";
        "<c-e>" = "down";
        "<enter>" = "open";
        gh = "cd ~";
        gr = "cd /";
        "<m-up>" = "up";
        "<m-down>" = "down";
        R = "bulk-rename";
        zp = "set preview!";
        t = "$tig -C $PWD";
        M = "push $mkdir<space>";

        # Navigation
        ga = "cd /media/Storage/anime";
        gc = "cd ~/.config";
        gd = "cd ~/Documents";
        git = "cd ~/Downloads/GIT";
        gmd = "cd /media/MEGAsync/Notes/Obsidian";
        gmo = "cd /media/Storage/Movies/";
        gmu = "cd /media/Storage/Music/";
        gmw = "cd /media/Storage/";
        gn = "cd /media/Documents/Notes";
        gp = "cd ~/Pictures";
        gs = "cd ~/Pictures/Screenshots";

        # TRASH MAPPINGS
        dd = "trash";
        tc = "clear_trash";
        tr = "restore_trash";

        # WALLPAPER
        ";" = "setwallpaper";
        w = "setwallpaper-dark";
    };
}
