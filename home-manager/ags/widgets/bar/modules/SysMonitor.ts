const freeCPU = Variable(0, {
  poll: [
    2000,
    "top -b -n 1",
    (out) =>
      Math.ceil(
        out
          .split("\n")
          .find((line) => line.includes("Cpu(s)"))
          .split(/\s+/)[1]
          .replace(",", "."),
      ),
  ],
});

const CpuUsage = () =>
  Widget.Label({
    class_name: "cpu-usage",
    setup: (self) =>
      self.hook(freeCPU, () => {
        self.label = " " + freeCPU.value.toString() + "%";
      }),
  });

const divide = (num1: number, num2: number) => (num1 / num2).toFixed(1);

const ram = Variable(0, {
  poll: [
    2000,
    "free",
    (out) =>
      out
        .split("\n")
        .find((line) => line.includes("Mem:"))
        .split(/\s+/),
  ],
});

const MemoryUsage = () =>
  Widget.Label({
    class_name: "memory-usage",
    setup: (self) =>
      self.hook(ram, () => {
        self.label =
          " " +
          divide(ram.value.splice(2, 1), 1048576) +
          "GB" +
          "/" +
          divide(ram.value.splice(1, 1), 1048576) +
          "GB";
      }),
  });

export { CpuUsage, MemoryUsage };
