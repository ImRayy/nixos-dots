const audio = await Service.import("audio");

const showVolumeSlider = Variable(false);

const volumeIndicator = Widget.Button({
  class_name: "volume-indicator",
  on_clicked: () => (audio.speaker.is_muted = !audio.speaker.is_muted),
  child: Widget.Box({
    children: [
      Widget.Icon().hook(audio.speaker, (self) => {
        const vol = audio.speaker.volume * 100;
        const icon = [
          [101, "overamplified"],
          [67, "high"],
          [34, "medium"],
          [1, "low"],
          [0, "muted"],
        ].find(([threshold]) => threshold <= vol)?.[1];

        self.icon = `audio-volume-${icon}-symbolic`;
      }),
      Widget.Label().hook(audio.speaker, (self) => {
        const vol = audio.speaker.volume * 100;
        self.label = ` ${Math.floor(vol)}%`;
      }),
    ],
  }),
});

const volumeSlider = Widget.Box({
  css: "min-width: 140px;",
  children: [
    Widget.Slider({
      hexpand: true,
      draw_value: false,
      on_change: ({ value }) => (audio.speaker.volume = value),
      setup: (self) =>
        self.hook(audio.speaker, () => {
          self.value = audio.speaker.volume || 0;
        }),
    }),
  ],
});

const revealer = (show = false) =>
  Widget.Revealer({
    revealChild: show,
    transitionDuration: 300,
    transition: "slide_right",
    child: volumeSlider,
    setup: (self) =>
      show &&
      self.poll(10000, () => {
        showVolumeSlider.value = !show;
      }),
  });

export default () =>
  Widget.EventBox({
    class_name: "volume",
    onSecondaryClick: () => (showVolumeSlider.value = !showVolumeSlider.value),
    onHover: () => (showVolumeSlider.value = true),
    on_hover_lost: () => (showVolumeSlider.value = false),
    child: Widget.Box({
      children: [volumeIndicator, revealer(showVolumeSlider.bind())],
    }),
  });
