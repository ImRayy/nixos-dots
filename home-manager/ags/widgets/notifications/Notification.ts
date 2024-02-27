import GLib from "gi://GLib";

const time = (time: number, format = "%H:%M") =>
  GLib.DateTime.new_from_unix_local(time).format(format);

export const NotificationIcon = ({ app_entry, app_icon, image }) => {
  if (image) {
    return Widget.Box({
      vpack: "start",
      hexpand: false,
      class_name: "icon img",
      css: `
          background-image: url("${image}");
          background-size: contain;
          background-repeat: no-repeat;
          background-position: center;
          min-height: 100px;
          min-width: 100px;
          border-radius: 6px;
          padding-right: 4px;
      `,
    });
  }
  let icon = "dialof-information-symbolic";
  if (Utils.lookUpIcon(app_icon)) icon = app_icon;
  if (app_entry && Utils.lookUpIcon(app_entry || "")) icon = app_entry || "";

  return Widget.Box({
    vpack: "start",
    hexpand: false,
    class_name: "icon",
    css: "min-height: 78px;min-width:78px",
    child: Widget.Icon({
      icon,
      size: 58,
      hpack: "center",
      vpack: "center",
      vexpand: true,
    }),
  });
};

export default (n) => {
  const icon = Widget.Box({
    vpack: "start",
    class_name: "icon",
    child: NotificationIcon(n),
  });

  // Title
  const title = Widget.Label({
    class_name: "title",
    xalign: 0,
    justification: "left",
    hexpand: true,
    max_width_chars: 24,
    truncate: "end",
    wrap: true,
    label: n.summary.trim(),
    use_markup: true,
  });

  // Description
  const description = Widget.Label({
    class_name: "description",
    hexpand: true,
    use_markup: true,
    xalign: 0,
    justification: "left",
    label: n.body.trim(),
    max_width_chars: 28,
    wrap: true,
  });

  const clock = Widget.Label({
    class_name: "time",
    vpack: "start",
    label: time(n.time),
  });

  // Close Button
  const closeButton = Widget.Button({
    class_name: "close-button",
    vpack: "start",
    css: `
    min-width: 6px;
    min-height: 6px;
    border-radius: 10rem;
    `,
    child: Widget.Icon("window-close-symbolic"),
    on_clicked: n.close,
  });

  // Main Window
  return Widget.Box({
    class_name: `notification ${n.urgency}`,
    css: "min-width: 25rem;",
    children: [
      icon,
      Widget.Box({
        hexpand: true,
        vertical: true,
        children: [
          Widget.Box({
            children: [title, clock, closeButton],
          }),
          description,
        ],
      }),
    ],
  });
};
