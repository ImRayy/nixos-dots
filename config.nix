{
    username = "ray";
    systemConfig = {
        hostname = "EverFrost";
        locale = "en_IN";
        timezone = "Asia/Kolkata";
        sddm = {
            background = "https://w.wallhaven.cc/full/zy/wallhaven-zyvrxy.png";
            sha256 = "sha256-7ikZwIowFRWIMCSfrUxBFpTz1d+dWYsf+WAkrq+bcfk=";
        };
    };

    homeConfig = {
        theme = "catppuccin-mocha";
        statusBar = "ags"; /* ["waybar" | "ags"] */
        notificationDaemon = "ags"; /* ["mako" | "ags"] */
    };
}
