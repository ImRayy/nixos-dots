export default Widget.EventBox({
  onPrimaryClick: () => Utils.exec("kitty -e --hold neofetch"),
  child: Widget.Label({
    class_name: "distro-icon",
    label: "",
  }),
});
