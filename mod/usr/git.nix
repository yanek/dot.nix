{ userSettings, ... }:

{
  programs.git = {
    enable = true;
    userName = userSettings.fullname;
    userEmail = userSettings.email;
    extraConfig = {
      core.editor = "hx";
      init.defaultBranch = "main";
      safe.directory = "*";
      url = {
        "https://github.com/".insteadOf = "gh:";
        "https://gist.github.com/".insteadOf = "gist:";
        "https://bitbucket.org/".insteadOf = "bb:";
      };
      alias = {
        lg = "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
      };
    };
  };
}
