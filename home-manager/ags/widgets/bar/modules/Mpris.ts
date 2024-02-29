import Mpris from "resource:///com/github/Aylur/ags/service/mpris.js";
import { Capatilize } from "utils";

function statusIcon(status: "Playing" | "Paused") {
  if (status === "Playing") return "󰏤";
  else return "";
}

const ignorePlayers = ["firefox", "chromium"];

const playerIcons = (name: string) => {
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

export default () =>
  Widget.Button({
    class_name: "media",
    on_primary_click: () => Mpris.getPlayer("")?.playPause(),
    on_scroll_up: () => Mpris.getPlayer("")?.next(),
    on_scroll_down: () => Mpris.getPlayer("")?.previous(),
    child: Widget.Label("-").hook(Mpris, (self) => {
      const player = Mpris.getPlayer("spotify") || Mpris.getPlayer();

      if (player) {
        const { name, track_artists, track_title, play_back_status } = player;

        if (!ignorePlayers.includes(name)) {
          self.label =
            playerIcons(name) +
            " " +
            track_artists.join(", ") +
            " - " +
            track_title +
            " " +
            statusIcon(play_back_status);
        } else
          self.label = `${playerIcons(name)} ${Capatilize(name)} is playing something ${statusIcon(play_back_status)}`;
      } else self.label = "";
    }),
  });
