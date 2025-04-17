{
  pkgs,
  ...
}:

{
  # programs.dconf.enable = true;
  # environment.pathsToLink = [ "/libexec" ]; # links /libexec from derivations to /run/current-system/sw

  # services.displayManager = {
  #   defaultSession = "sway";
  # };

  # services.xserver = {
  #   xkb.layout = "eu";

  #   displayManager.lightdm.enable = true;

  #   desktopManager = {
  #     xterm.enable = false;
  #   };
  # };

  # security.pam.loginLimits = [
  #   {
  #     domain = "@users";
  #     item = "rtprio";
  #     type = "-";
  #     value = 1;
  #   }
  # ];

  services.gnome.gnome-keyring.enable = true;
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };

  services.libinput = {
    enable = true;
    mouse.accelProfile = "flat";
  };

  environment.systemPackages = with pkgs; [
    rofi-wayland
    polybar
    dunst
    # feh
    grim
    lxappearance
    mako
    pango
    pavucontrol
    siji # font required by polybar
    slurp
    wl-clipboard
    xfce.thunar
    xwayland
    pulsemixer
    nordic
  ];
}
