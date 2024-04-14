import Mpris from "resource:///com/github/Aylur/ags/service/mpris.js";
import { MprisPlayer } from "types/service/mpris";

function statusIcon(status: "Playing" | "Paused") {
  if (status === "Playing") return "󰏤";
  else return "";
}

export const playerIcons = (name: string) => {
  switch (name) {
    case "spotify":
      return "";
    case "Lollypop":
      return "";
    case "firefox":
      return "󰈹";
    case "chromium":
      return "";
    default:
      return "󰎈 ";
  }
};

const Player = (player: MprisPlayer) => {
  const mpris = player.getPlayer("spotify") || player.getPlayer();
  const { name, track_artists, track_title, play_back_status } = mpris;

  const icon = Widget.Label({
    class_name: "player-icon",
    label: playerIcons(name),
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
    on_primary_click: () => Mpris.getPlayer("")?.playPause(),
    on_scroll_up: () => Mpris.getPlayer("")?.next(),
    on_scroll_down: () => Mpris.getPlayer("")?.previous(),
    setup: (self) =>
      self.hook(Mpris, (self) => {
        self.child = Player(Mpris);
      }),
  });
