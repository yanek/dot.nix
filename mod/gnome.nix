{
  pkgs,
  ...
}:

{
  services.xserver = {
    enable = true;
    xkb.layout = "eu";
    displayManager.gdm = {
      enable = true;
      wayland = false;
    };
    desktopManager.gnome.enable = true;
  };

  environment = {
    gnome.excludePackages = with pkgs; [
      epiphany
      gnome-music
      gnome-terminal
      gnome-tour
      gnome-maps
      gnome-weather
      totem
    ];

    systemPackages = with pkgs; [
      gnome-tweaks

      nordic # GTK + Qt theme
      zafiro-icons
      simp1e-cursors

      gnomeExtensions.blur-my-shell
      gnomeExtensions.dash-to-dock
      gnomeExtensions.sound-output-device-chooser
      gnomeExtensions.pop-shell
    ];
  };
}
