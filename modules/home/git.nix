{
  config,
  lib,
  userSettings,
  ...
}:
with lib;
let
  cfg = config.myHome.git;
in
{
  options.myHome.git = {
    enable = mkEnableOption "git";
    gui = mkOption {
      default = "lazygit";
      type = types.enum [
        "lazygit"
        "gitui"
      ];
    };
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
    lazygit = mkIf (cfg.gui == "lazygit") {
      enable = true;
    };
    gitui = mkIf (cfg.gui == "gitui") {
      enable = true;
      keyConfig =
        # ron
        ''
          (
            move_left: Some(( code: Char('h'), modifiers: "")),
            move_right: Some(( code: Char('l'), modifiers: "")),
            move_up: Some(( code: Char('k'), modifiers: "")),
            move_down: Some(( code: Char('j'), modifiers: "")),
          )
        '';
    };
  };
}
