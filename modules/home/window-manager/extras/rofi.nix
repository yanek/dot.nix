{config, ...}: {
  programs.rofi = {
    enable = true;
    terminal = config.myHome.term.command;
  };
}
