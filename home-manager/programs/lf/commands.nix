{ config, pkgs, ... }: 

{

    home.packages = with pkgs; [ swww ];
    programs.lf.commands = {
        open = ''
        ''${{
            case $(file --mime-type "$f" -bL) in
                text/*|application/json) $EDITOR "$f";;
                *) xdg-open "$f" ;;
            esac
        }}
        '';

        mkdir = ''
        ''${{
            printf "Directory Name: "
            read ans
            mkdir $ans
        }}
        '';

        mkfile = ''
        ''${{
            printf "File Name: "
            read ans
            $EDITOR $ans
        }}
        '';

        chmod = ''
        ''${{
            printf "Mode Bits: "
            read ans

            for fine in "$fx"
            do
                chmod $ans $fine
            done

            lf --remote 'send reload'
        }}
        ''; 

        setwallpaper = ''
        ''${{
            img_extensions=("jpg" "jpeg" "png" "gif")
            extension="''${f##*.}"
            if [[ " ''${img_extensions[@]} " == *" $extension "* ]]; then
                if [[ $DESKTOP_SESSION == hyprland ]];then
                    pkill hyprpaper
                    sleep 1
                    echo "$f" >>  ~/.config/wall.txt && ~/.scripts/set-wall
                    echo -e "preload = $f\nwallpaper = HDMI-A-1,$f\nsplash = false"\
                    | tee ~/.config/hypr/hyprpaper.conf
                elif [[ $XDG_SESSION_TYPE == x11 ]];then
                    echo "$f" >>  ~/.config/wall.txt && ~/.scripts/set-wall
                else 
                printf "\033[31mError: 'setwallpaper' function not configured for your window manager or desktop enviroment. Edit the 'home-manager/programs/lf/commands.nix' file to configure it properly.\033[0m\n"
                fi
            else
                printf "\033[31mSelected file isn't a image file!\033[0m\n"
            fi
        }}
        '';

        # Archive
        unarchive = ''
        ''${{
            case "$f" in
                *.zip)
                    FILENAME="''${f%.*}"
                    mkdir "$FILENAME" && unzip $f -d "$FILENAME/">/dev/null 2>&1
                ;;
                *.tar.gz) tar -xzvf "$f" ;;
                *.tar.bz2) tar -xjvf "$f" ;;
                *.tar) tar -xvf "$f" ;;
                *) echo "Unsupported format" ;;
            esac
        }}
        '';

        zip = ''%zip -r "$f" "$f"'';
        tar = ''%tar cvf "$f.tar" "$f"'';
        targz = ''%tar cvzf "$f.tar.gz" "$f"'';
        tarbz2 = ''%tar cjvf "$f.tar.bz2" "$f"'';

        # Trash
        trash = ''
        ''${{
            files=$(printf "$fx" | tr '\n' ';')
            while [ "$files" ]; do
              file=''${files%%;*}
              trash-put "$(basename "$file")"
              if [ "$files" = "$file" ]; then
                files=""
              else
                files="''${files#*;}"
              fi
            done
        }}
        '';
        clear_trash = ''%trash-empty'';
        restore_trash = ''''${{trash-restore}}'';

        select_dirs = ''
        ''${{
            get_dirs() {
                if [ "$lf_hidden" = 'false' ]; then
                    find "$PWD" -mindepth 1 -maxdepth 1 -type d -not -name '.*' -print0
                else
                    find "$PWD" -mindepth 1 -maxdepth 1 -type d -print0
                fi |
                xargs -0 printf ' %q'
            }

            lf -remote "send $id :unselect; toggle $(get_dirs)"
        }}
        '';

       # zoxide: a smarter cd command. Supports all major shells.
        z = ''
        %{{
        	result="$(zoxide query --exclude $PWD $@ | sed 's/\\/\\\\/g;s/"/\\"/g')"
        	lf -remote "send $id cd \"$result\""
        }}
        '';
        zi = ''
        ''${{
	        result="$(zoxide query -i | sed 's/\\/\\\\/g;s/"/\\"/g')"
	        lf -remote "send $id cd \"$result\""
        }}
        '';
        on_cd = ''
            zoxide add "$PWD"
        '';
    };
}
