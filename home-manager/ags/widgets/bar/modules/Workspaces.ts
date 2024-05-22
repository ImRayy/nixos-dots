const hyprland = await Service.import("hyprland");

const dispatch = (ws) => hyprland.messageAsync(`dispatch workspace ${ws}`);

export default () =>
  Widget.EventBox({
    onScrollUp: () => dispatch("+1"),
    onScrollDown: () => dispatch("-1"),
    child: Widget.Box({
      class_name: "workspaces",
      children: Array.from({ length: 5 }, (_, i) => i + 1).map((i) =>
        Widget.Button({
          attribute: i,
          onClicked: () => dispatch(i),
        }),
      ),

      // remove this setup hook if you want fixed number of buttons
      setup: (self) =>
        self.hook(hyprland, () =>
          self.children.forEach((btn) => {
            btn.label =
              hyprland.active.workspace.id === btn.attribute ? "" : "";
            btn.class_name = "indicator-icons";
          }),
        ),
    }),
  });
