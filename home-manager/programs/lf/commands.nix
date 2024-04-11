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
                if [ $DESKTOP_SESSION == gnome-xorg ];then
                    gsettings set org.gnome.desktop.background picture-uri "$f"
                elif [ $DESKTOP_SESSION == hyprland ];then
                    pkill hyprpaper
                    sleep 1
                    echo "$f" >>  ~/.config/wall.txt && ~/.scripts/set-wall
                    echo -e "preload = $f\nwallpaper = HDMI-A-1,$f\nsplash = false"\
                    | tee ~/.config/hypr/hyprpaper.conf
                else
                    cp "$f" ~/.config/ && feh --bg-fill ~/.config/wall.png
                fi
            else
                echo "Selected file isn't a image file!"
            fi
        }}
        '';

        # Archive
        unarchive = ''
        ''${{
            case "$f" in
                *.zip) 7z x "$f" ;;
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
    };
}
