{userSettings, ...}: {
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    autoLogin.relogin = true;
    settings = {
      Autologin = {
        User = userSettings.username;
        # Session = "hyprland-uwsm";
        Session = "sway";
      };
    };
  };
}
