#!/usr/bin/env zx

const args = process.argv.slice(3);

const getSinks = async () => {
  const status = (await $`wpctl status`).text();
  return status
    .split("\n")
    .slice(
      status.split("\n").findIndex((line) => line.includes("Sinks:")) + 1,
      status.split("\n").findIndex((line) => line.includes("Sources:")),
    )
    .filter((line) => !line.includes("Easy Effects"))
    .map((line) => line.replace("│", "").replace("*", "").trim())
    .filter((line) => line);
};

const getId = (sink) => {
  return parseInt(sink.match(/^\d+/)[0]);
};

const sink = args.shift();
if (sink) {
  await $`wpctl set-default ${getId(sink)}`;
} else {
  (await getSinks()).forEach((sink) => console.log(sink));
}
