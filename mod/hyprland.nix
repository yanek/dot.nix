{ pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  programs.waybar.enable = true;

  environment.sessionVariables = {
    # WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };

  environment.systemPackages = with pkgs; [
    dunst
    swww
    rofi-wayland
  ];

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  hardware = {
    opengl.enable = true;
    nvidia.modesetting.enable = true;
  };
}
