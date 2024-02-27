import Notification from "./Notification";

export const notifications = await Service.import("notifications");
const popups = notifications.bind("popups");

notifications.popupTimeout = 5000;

export default () =>
  Widget.Window({
    name: "notifications",
    anchor: ["top", "right"],
    child: Widget.Box({
      css: "padding: 0.1px;",
      child: Widget.Box({
        class_name: "notifications",
        vertical: true,
        vexpand: false,
        children: popups.as((popups) => popups.map(Notification)),
      }),
    }),
  });
