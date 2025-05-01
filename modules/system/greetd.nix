{
  userSettings,
  pkgs,
  ...
}: {
  services.greetd = {
    enable = true;
    settings = {
      initial_session = {
        command = "uwsm start hyprland.desktop";
        user = "${userSettings.username}";
      };
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --greeting 'Welcome' --asterisks --remember --remember-user-session --time --cmd uwsm start hyprland.desktop";
        user = "greeter";
      };
    };
  };
}
