const network = await Service.import("network");

const WifiIndicator = () =>
  Widget.Box({
    children: [
      Widget.Icon({
        icon: network.wifi.bind("icon_name"),
      }),
    ],
  });

const WiredIndicator = () =>
  Widget.Icon({
    icon: network.wired.bind("icon_name"),
  });

const NetworkIndicator = () =>
  Widget.Stack({
    class_name: "network-indicator",
    items: [
      ["wifi", WifiIndicator()],
      ["wired", WiredIndicator()],
    ],
    shown: network.bind("primary").as((p) => p || "wifi"),
  });

export { WiredIndicator, NetworkIndicator };
