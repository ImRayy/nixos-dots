const Audio = await Service.import("audio");

export default () =>
  Widget.Window({
    name: "osd",
    anchor: ["right"],
    properties: [["count", -1]],
    connections: [
      [
        Audio,
        (self) => {
          if (self._count < 0) self._count = 0;
          self.visible = true;
          self._count++;
          Utils.timeout(2000, () => {
            self._count--;
            if (self._count === 0) self.visible = false;
          });
        },
        "speaker-changed",
      ],
    ],
    layer: "overlay",
    child: Widget.Box({
      vertical: true,
      children: [
        Widget.Icon().hook(Audio.speaker, (self) => {
          self.class_name = "osd-icon";
          const vol = Audio.speaker.volume * 100;
          const icon = [
            [101, "overamplified"],
            [67, "high"],
            [34, "medium"],
            [1, "low"],
            [0, "muted"],
          ].find(([threshold]) => threshold <= vol)?.[1];

          self.icon = `audio-volume-${icon}-symbolic`;
        }),
        Widget.ProgressBar({
          vexpand: true,
          inverted: true,
          vertical: true,
          hpack: "center",
          setup: (self) =>
            self.hook(Audio.speaker, (self) => {
              const vol = Audio.speaker.volume * 100;
              self.value = Math.floor(vol) / 100;
            }),
        }),
      ],
    }),
  });
