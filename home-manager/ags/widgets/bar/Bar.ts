import ClientTitle from "./modules/ClientTitle.ts";
import Clock from "./modules/Clock.ts";
import OsIcon from "./modules/OsIcon.ts";
import Separator from "./modules/Separator";
import SysTray from "./modules/SysTray.ts";
import Volume from "./modules/Volume.ts";
import Workspaces from "./modules/Workspaces.ts";
import { CpuUsage, MemoryUsage } from "./modules/SysMonitor.ts";
import { NetworkIndicator } from "./modules/Network.ts";
import PowermenuIcon from "./modules/PowermenuIcon.ts";
import Mpris from "./modules/Mpris.ts";

// Bar layouts
const Left = () =>
  Widget.Box({
    spacing: 8,
    children: [
      OsIcon,
      Separator(),
      Workspaces(),
      Separator(),
      CpuUsage(),
      Separator(),
      MemoryUsage(),
      ClientTitle(),
    ],
  });

const Center = () =>
  Widget.Box({
    spacing: 8,
    children: [Mpris()],
  });

const Right = () =>
  Widget.Box({
    hpack: "end",
    spacing: 8,
    children: [
      SysTray(),
      NetworkIndicator(),
      Separator(),
      Volume(),
      Separator(),
      Clock(),
      Separator(),
      PowermenuIcon,
    ],
  });

export default (monitor = 0) =>
  Widget.Window({
    name: `bar-${monitor}`,
    monitor,
    anchor: ["top", "left", "right"],
    exclusivity: "exclusive",
    child: Widget.CenterBox({
      class_name: "bar",
      start_widget: Left(),
      center_widget: Center(),
      end_widget: Right(),
    }),
  });
