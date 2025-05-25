{
  config,
  lib,
  userSettings,
  ...
}:
with lib;
{
  options.myHome.git = {
    enable = mkEnableOption "git";
  };

  config.programs = mkIf config.myHome.git.enable {
    git = {
      enable = true;
      userName = userSettings.fullname;
      userEmail = userSettings.email;
      extraConfig = {
        core.editor = config.home.sessionVariables.EDITOR;
        init.defaultBranch = "main";
        pull.rebase = true;
        safe.directory = "*";
        url = {
          "git@github.com:".insteadOf = "gh:";
          "https://gist.github.com/".insteadOf = "gist:";
          "https://bitbucket.org/".insteadOf = "bb:";
        };
        alias = {
          lg = "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
        };
      };
      delta = {
        enable = true;
        options = with config.lib.stylix.colors.withHashtag; {
          dark = true;
          minus-style = "${base08} bold";
          plus-style = "${base0B} bold";
        };
      };
    };
    lazygit = {
      enable = true;
    };
  };
}
