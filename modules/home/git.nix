{
  config,
  lib,
  userSettings,
  ...
}:
let
  cfg = config.spec.home.git;
in
{
  options.spec.home.git =
    let
      inherit (lib) mkEnableOption mkOption;
    in
    {
      enable = mkEnableOption "git";
      gui = mkOption {
        default = "lazygit";
        type = lib.types.enum [
          "lazygit"
          "gitui"
        ];
      };
    };

  config.programs =
    let
      inherit (lib) mkIf;
    in
    mkIf cfg.enable {
      git = {
        enable = true;
        lfs.enable = true;
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

      # TODO: Replace with generic shell aliases module
      fish.shellAbbrs = {
        "gs" = "git status";
        "gl" = "git lg";
        "lg" = "lazygit";
      };
    };
}
