{pkgs, ...}: {
  imports = [
    ./rules.nix
    ./decoration.nix
    ./environment.nix
    ./startup.nix
    ./input.nix
    ./keybinds.nix

    ../../programs/waybar/waybar.nix
  ];

  services.gnome-keyring.enable = true;

  programs.waybar.systemd = {
    enable = true;
    target = "sway-session.target";
  };

  wayland.windowManager.sway = {
    enable = true;
    checkConfig = false;
    package = pkgs.swayfx;
    xwayland = true;
    swaynag.enable = true;
    config.bars = []; # disable swaybar
    extraOptions = ["--unsupported-gpu"];
  };

  home.sessionVariables = {
    LIBVA_DRIVER_NAME = "nvidia";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    __GL_THREADED_OPTIMIZATIONS = "0";
    NIXOS_OZONE_WL = "1";
    ELECTRON_OZONE_PLATFORM_HINT = "auto";
  };
}
