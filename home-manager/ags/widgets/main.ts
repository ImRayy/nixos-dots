import Bar from "./bar/Bar.ts";
import NotificationPopups from "./notifications/NotificationPopups.ts";
import OSD from "./osd/OSD.ts";

export default {
  windows: [Bar(), NotificationPopups(), OSD()],
};
