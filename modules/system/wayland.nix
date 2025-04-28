{
  pkgs,
  ...
}:

{
  programs.dconf.enable = true;
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
    libnotify
  ];
}
