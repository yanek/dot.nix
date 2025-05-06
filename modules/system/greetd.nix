{
  userSettings,
  pkgs,
  ...
}: {
  services.greetd = {
    enable = true;
    settings = rec {
      initial_session = {
        command = "${pkgs.sway}/bin/sway --unsupported-gpu";
        user = "${userSettings.username}";
      };
      default_session = initial_session;
    };
  };
}
