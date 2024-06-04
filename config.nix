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
        windowManager = "qtile"; /* ["hyprland" | "qtile" | "all" ]  */
    };

    homeConfig = {
        theme = "catppuccin-mocha";

        # Wayland specific, with qtile being selected none of following will work

        statusBar = "ags"; /* ["waybar" | "ags"] */
        notificationDaemon = "mako"; /* ["mako" | "ags"] */
    };
}
