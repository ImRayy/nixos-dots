{pkgs, ...}: let
  # ---------------------------------------------------------------------------
  # 🔌 Run any applicaton from terminal in detached mode
  # ---------------------------------------------------------------------------
  orphan = pkgs.writeShellApplication {
    name = "orphan";
    text = ''
      nohup "$@" > /dev/null 2>&1 &
      disown
    '';
  };

  # ---------------------------------------------------------------------------
  backupFile = pkgs.writeShellApplication {
    name = "bak";
    text = ''
      cp "$1" "$1.bak"
    '';
  };

  # ---------------------------------------------------------------------------
  # 🛫 To remove nixos system generations with ease
  # ---------------------------------------------------------------------------
  removeSystemGens = pkgs.writeShellApplication {
    name = "rm-sys-gens";
    text = ''
      profile_path="/nix/var/nix/profiles/system"
      sudo nix-env --list-generations --profile "$profile_path"
      keep=$(gum input --placeholder "Recent gens to keep? ")
      sudo nix-env --delete-generations +"$keep" --profile "$profile_path"
    '';
  };

  # ---------------------------------------------------------------------------
  # Same as removeSystemGens but for home-manager
  # ---------------------------------------------------------------------------
  removeHomeManagerGens = pkgs.writeShellApplication {
    name = "hm-remove-gens";
    text = ''
      gens=$(home-manager generations | awk '{print $5}')
      first_id=$(echo "$gens" | awk '{print $NF}')
      last_id=$(echo "$gens" | awk '{print $1}')
      total_gens=$(echo "$gens" | wc -w)

      echo "Total $total_gens generations found" \
          "$first_id - $last_id"

      keep=$(gum input --placeholder "How many recent generations to keep?")
      remove=$(echo "$gens" | tail -n +"''$((keep + 1))")

      if [[ -z "$keep" ]]; then
          echo "None selected, exiting..."
          exit 1
      fi

      gum spin --spinner="dot" --title="Cleaning up generation..." \
          -- home-manager remove-generations "$remove"
      echo "Success!"
    '';
  };

  # ---------------------------------------------------------------------------
  #   Get all video titles from a YouTube playlist
  # ---------------------------------------------------------------------------
  getPlaylistTitles = pkgs.writeShellApplication {
    name = "get-playlist-titles";
    text = ''
      if [ -z "$1" ]; then
        echo "Usage: get-playlist-titles <playlist_url>"
        exit 1
      fi
      yt-dlp --flat-playlist -J "$1" |  "${pkgs.jq}/bin/jq" -r '.entries[].title'
    '';
  };

  # ---------------------------------------------------------------------------
  #   Download a YouTube playlist in 1080p (or lower)
  # ---------------------------------------------------------------------------
  downloadYtPlaylist = pkgs.writeShellApplication {
    name = "dl-yt-playlist";
    text = ''
      if [ -z "$1" ];then
        echo "Usage: dl-yt-playlist [start] [end] <playlist_url>"
        echo "  [start] and [end] are optional; leave blank to download the entire playlist."
        echo "  <playlist_url> is required."
        exit 1
      fi

      START=$1
      END=$2
      URL=$3

      CMD="yt-dlp -f \"bestvideo[height<=1080]+bestaudio/best[height<=1080]\""

      [ -n "$START" ] && CMD="$CMD --playlist-start $START"
      [ -n "$END" ] && CMD="$CMD --playlist-end $END"

      CMD="$CMD \"$URL\" -o \"%(playlist_index)02d.-%(title)s.%(ext)s\""

      eval "$CMD"
    '';
  };
in {
  home.packages = [
    removeSystemGens
    orphan
    backupFile
    removeHomeManagerGens
    getPlaylistTitles
    downloadYtPlaylist
  ];
}
