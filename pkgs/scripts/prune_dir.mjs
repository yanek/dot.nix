#!/usr/bin/env zx

const prune = async (args) => {
  const notify = (isNotifiable, dir, count) => {
    if (!isNotifiable || count == 0) return;

    const data = {
      summary: "Pruning directory",
      text: `The directory ${dir} is being purged.\n${count} file(s) deleted.`,
    };
    $`notify-send -u low ${data.summary} ${data.text}`;
  };

  if (!args.target || !args.since) {
    console.error(
      "Error: Please specify a target AND a delay with:\n" +
        "\t--target=ABSOLUTE_PATH\n" +
        "\t--since=DELAY_IN_HOURS",
    );
    return;
  }

  if (!(await fs.pathExists(args.target))) {
    console.error(`Error: Directory not found:\n${args.target}`);
    return;
  }

  const toHours = (timestamp) => timestamp / 3600000;
  const toAge = (creationTimestamp) => toHours(Date.now() - creationTimestamp);
  const toFileData = async (path) => ({
    path: path,
    age: toAge(Date.parse(await $`stat -c '%w' ${path}`)),
  });

  const pathList = await glob(path.join(args.target, "*"));
  const all = await Promise.all(pathList.map(async (file) => toFileData(file)));
  const removables = all.filter((file) => file.age > args.since);

  if (!args.dry) {
    removables.forEach(async (file) => echo(await $`rm -rvf ${file.path}`));
  }

  notify(args.notify, args.target, removables.length);
};

prune(minimist(process.argv.slice(3)));
