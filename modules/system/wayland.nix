{pkgs, ...}: {
  programs.dconf.enable = true;

  programs.uwsm = {
    enable = true;
    waylandCompositors.hyprland = {
      prettyName = "Hyprland";
      comment = "Hyprland compositor managed by UWSM";
      binPath = "/run/current-system/sw/bin/Hyprland";
    };
  };

  security.polkit.enable = true;
  security.pam.loginLimits = [
    {
      domain = "@users";
      item = "rtprio";
      type = "-";
      value = 1;
    }
  ];

  environment.systemPackages = with pkgs; [
    wl-clipboard
    wlprop
    newt
    libnotify
  ];
}
