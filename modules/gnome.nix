{ pkgs, ... }:

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

  environment.gnome.excludePackages = (with pkgs; [
    epiphany
    gnome-music
    gnome-terminal
    gnome-tour
    totem
  ]);

  environment.systemPackages = with pkgs; [
    gnomeExtensions.blur-my-shell
    gnomeExtensions.dash-to-dock
  ];
}
