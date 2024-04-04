const Audio = await Service.import("audio");

let startupVisibility = false;

setTimeout(() => {
  startupVisibility = true;
}, 2000);

export default () =>
  Widget.Window({
    name: "osd",
    anchor: ["right"],
    layer: "overlay",
    visible: startupVisibility,
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
    setup: (self) =>
      self.hook(
        Audio.speaker,
        () => {
          let count = -1;
          if (!startupVisibility) {
            return;
          }
          if (count < 0) count = 0;
          self.visible = true;
          count++;
          Utils.timeout(2000, () => {
            count--;
            if (count === 0) self.visible = false;
          });
        },
        "notify::volume",
      ),
  });
