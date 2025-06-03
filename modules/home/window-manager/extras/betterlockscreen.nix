{
  services = {
    betterlockscreen = {
      enable = true;
      arguments = [
        "blur"
        "--display 1"
      ];
      inactiveInterval = 10;
    };
    screen-locker = {
      enable = true;
      xautolock = {
        enable = true;
        detectSleep = true;
      };
    };
  };
}
