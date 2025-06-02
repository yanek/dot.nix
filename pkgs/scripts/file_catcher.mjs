#!/usr/bin/env zx

const parseArguments = async () => {
  const args = minimist(process.argv.slice(3));

  if (!args.source || !args.dest) {
    console.error("Usage: file_catcher.mjs --source <path> --dest <path>");
    process.exit(1);
  }

  if (!(await fs.pathExists(args.source))) {
    console.error(`Source directory does not exist: ${args.source}`);
    process.exit(1);
  }

  return args;
};

const startWatcher = async (args) => {
  try {
    const watcher = $`inotifywait -m -e create,moved_to ${args.source}`;

    console.log(`Watching: ${args.source}`);
    console.log(`Destination: ${args.dest}`);

    for await (const line of watcher.stdout) {
      const lineStr = line.toString().trim();
      if (!lineStr) continue;

      const nameParts = lineStr.split(/\s+/).slice(2);
      const file = nameParts.join(" ");

      if (file.endsWith(".torrent")) {
        await handleFile(file, args.source, args.dest);
      }
    }
  } catch (error) {
    console.error(`Watcher error: ${error.message}`);
    console.log("Restarting watcher in 5 seconds...");
    await sleep(5000);
    startWatcher();
  }
};

const handleFile = async (filename, source, dest) => {
  console.log(`Catched file: ${filename}, transfer will begin shortly...`);

  const from = path.join(source, filename);
  const to = path.join(dest, filename);

  // Wait a bit to ensure the file is fully written.
  await sleep(1000);

  try {
    const sync = await $`rsync -vi --remove-source-files ${from} ${to}`;
    echo(sync);
  } catch (error) {
    console.error(`Failed file transfer: ${error.message}`);
  }
};

startWatcher(await parseArguments());
