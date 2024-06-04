{ config, username,  ... }:

{
    home.file = {
        ".scripts/set-wall" = {
            text = ''
            log_path="/home/${username}/.config/wall.txt"

            wallpaper_path() {
            	cat $log_path | tail -n -1
            }

            set_wall_wayland() {
            	swww img "$(wallpaper_path)" \
            		--transition-fps 60 \
            		--transition-duration 2 \
            		--transition-type left \
            		--transition-bezier .42,0,.58,0.6
            }

            set_wall_xorg() {
            	feh --bg-fill "$(wallpaper_path)"
            }

            if [[ $XDG_SESSION_TYPE == wayland ]]; then
            	if ! pgrep -x swww-daemon >/dev/null; then
            		swww init && set_wall
            	else
            		set_wall
            	fi
            else
            	set_wall_xorg
            fi
            '';
            executable = true;
        };
    };
}
