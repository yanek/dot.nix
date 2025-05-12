{
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.ags.homeManagerModules.default];
  programs.ags = {
    enable = true;
    # systemd.enable = true;
    configDir = ./config;

    extraPackages = [
      inputs.ags.packages.${pkgs.system}.battery
    ];
  };
}
