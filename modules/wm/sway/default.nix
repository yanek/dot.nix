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
}
