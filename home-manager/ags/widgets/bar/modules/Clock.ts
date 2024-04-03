const date = Variable("", {
  poll: [1000, `date "+󰥔 %H:%M  󰃭 %A %d"`],
});

export default () =>
  Widget.Label({
    class_name: "clock",
    label: date.bind(),
  });
