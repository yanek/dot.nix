{
  pkgs,
  userSettings,
  ...
}:

{
  home.packages = [ pkgs.git ];

  programs.git = {
    enable = true;
    userName = userSettings.fullname;
    userEmail = userSettings.email;
    extraConfig = {
      init.defaultBranch = "main";
      safe.directory = "*";
    };
  };
}
