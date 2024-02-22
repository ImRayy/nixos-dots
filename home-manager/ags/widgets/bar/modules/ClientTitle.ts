const hyprland = await Service.import("hyprland");
import Separator from "./Separator.ts";

export default () =>
  Widget.Box({
    setup: (self) =>
      self.hook(hyprland, () => {
        const clientName = hyprland.active.client.bind("class").emitter.class;
        self.children = [];
        if (clientName !== "") {
          self.add(Separator());
        }
        self.add(
          Widget.Label({
            css: "padding-left: 6px;",
            class_name: "client-title",
            label:
              clientName !== ""
                ? "󱂬 " +
                  clientName.charAt(0).toUpperCase() +
                  clientName.slice(1)
                : "",
          }),
        );
        self.show_all();
      }),
  });
