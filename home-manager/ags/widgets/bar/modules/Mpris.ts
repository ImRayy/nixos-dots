import { floatingMediaPlayer } from "utils.ts";
import { playerIcons } from "lib/icons";

const mpris = await Service.import("mpris");

function statusIcon(status: "Playing" | "Paused" | "Stopped") {
  if (status === "Playing") return "󰏤";
  else return "";
}

interface PlayerProps {
  name: string;
  track_artists: string[];
  track_title: string;
  play_back_status: "Playing" | "Paused" | "Stopped";
}

const Player = ({
  name,
  track_artists,
  track_title,
  play_back_status,
}: PlayerProps) => {
  const icon = Widget.Button({
    class_name: "player-icon",
    css: "padding-right: 1px",
    on_primary_click: () =>
      (floatingMediaPlayer.value = floatingMediaPlayer.value ? false : true),
    child: Widget.Button({
      class_name: "player-icon-label",
      label: playerIcons(name),
    }),
  });

  const title = Widget.Label({
    class_name: "title",
    max_width_chars: 24,
    truncate: "end",
    wrap: true,
    label: track_title,
  });

  const artist = Widget.Label({
    class_name: "artist",
    max_width_chars: 24,
    truncate: "end",
    wrap: true,
    label: track_artists.join(", ") + " -",
  });

  const status = Widget.Label({
    class_name: "status-icon",
    label: statusIcon(play_back_status),
  });

  return Widget.Box({
    spacing: 6,
    children: [icon, artist, title, status],
  });
};

export default () =>
  Widget.Button({
    class_name: "media",

    on_primary_click: () =>
      (floatingMediaPlayer.value = floatingMediaPlayer.value ? false : true),
    setup: (self) =>
      self.hook(mpris, (self) => {
        const player = mpris.getPlayer("spotify") || mpris.getPlayer() || null;
        if (!player) {
          return;
        }

        const { name, track_artists, track_title, play_back_status } = player;
        if (play_back_status !== "Stopped") {
          self.child = Player({
            name: name,
            track_artists: track_artists,
            track_title: track_title,
            play_back_status: play_back_status,
          });
        } else {
          self.child = Widget.Label({
            label: "",
          });
        }
      }),
  });
