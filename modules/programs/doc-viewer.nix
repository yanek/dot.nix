{pkgs, ...}: {
  home.packages = [
    pkgs.mcomix
  ];

  programs.zathura = {
    enable = true;
  };
}
