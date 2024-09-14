{
  pkgs,
  config,
  username,
  homeConfig,
  ...
}:
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

  home.packages = [
    (pkgs.writeShellScriptBin "rm-sys-gens" ''
      profile_path="/nix/var/nix/profiles/system"
      sudo nix-env --list-generations --profile "$profile_path"
      keep=$(gum input --placeholder "Recent gens to keep? ")
      sudo nix-env --delete-generations +$keep --profile "$profile_path"
    '')

    (pkgs.writeShellScriptBin "orphan" ''
      nohup "$@" > /dev/null 2>&1 &
      disown
    '')

    (pkgs.writeShellScriptBin "bak" ''
      cp $1 "$1.bak"
    '')

    # Delete home-manager generations in bulk
    (pkgs.writeShellScriptBin "hm-remove-gens" ''
      gens=$(home-manager generations | awk '{print $5}')
      first_id=$(echo $gens | awk '{print $NF}')
      last_id=$(echo $gens | awk '{print $1}')
      total_gens=$(echo $gens | wc -w)

      echo "Total $total_gens generations found" \
          "$first_id - $last_id"

      keep=$(gum input --placeholder "How many recent generations to keep?")
      remove=$(echo "$gens" | tail -n +"$((keep + 1))")

      if [[ -z $keep ]]; then
          echo "None selected, exiting..."
          exit 1
      fi

      gum spin --spinner="dot" --title="Cleaning up generation..." \
          -- home-manager remove-generations $remove
      echo "Success!"
    '')
  ];
}
