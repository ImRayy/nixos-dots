const entry = App.configDir + "/widgets/main.ts";
const outdir = "/tmp/ags/js";
const scss = `${App.configDir}/style/style.scss`;
const css = `${App.configDir}/style.css`;

// Initially apples css
Utils.exec(`sassc ${scss} ${css}`);
App.applyCss(css);

// Monitor scss changes and reapply css
Utils.monitorFile(`${App.configDir}/style`, function () {
  Utils.exec(`sassc ${scss} ${css}`);
  App.applyCss(css);
});

try {
  await Utils.execAsync([
    "bun",
    "build",
    entry,
    "--outdir",
    outdir,
    "--external",
    "resource://",
    "--external",
    "git://*",
  ]);
} catch (error) {
  console.error(error);
}

const main = await import(`file://${outdir}/main.js`);

export default main.default;
