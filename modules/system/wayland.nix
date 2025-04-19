{
  pkgs,
  ...
}:

{
  programs.dconf.enable = true;
  security.polkit.enable = true;

  # services.displayManager = {
  #   defaultSession = "sway";
  # };

  services.xserver = {
    enable = true;
    xkb.layout = "eu";
  };

  # Disable mouse acceleration
  services.libinput = {
    enable = true;
    mouse.accelProfile = "flat";
  };

  systemd.user.services.kanshi = {
    description = "kanshi daemon";
    serviceConfig = {
      Type = "simple";
      ExecStart = ''${pkgs.kanshi}/bin/kanshi -c kanshi_config_file'';
    };
  };

  environment.systemPackages = with pkgs; [
    wl-clipboard
    xwayland
  ];
}
