{
  lib,
  config,
  ...
}:
with lib;
{
  programs.starship = with config.lib.stylix.colors.withHashtag; {
    enable = true;
    enableFishIntegration = true;
    enableBashIntegration = true;
    enableTransience = true;
    settings = {
      format = concatStrings [
        "[](fg:${base01})"
        "[ ](bg:${base01})"
        "$username"
        "[ ](bg:${base01})"
        "$hostname"
        "[ ](bg:${base01})"
        "$directory"
        "[ ](bg:${base01})"
        "$git_branch"
        "[ ](bg:${base01})"
        "[ ](fg:${base01})"
      ];
      right_format = concatStrings [
        "$nix_shell"
        "$cmd_duration"
      ];
      username = {
        show_always = true;
        format = "[$user]($style)";
        style_user = "${base05} bg:${base01}";
        style_root = "${base08} bg:${base01}";
      };
      hostname = {
        ssh_only = false;
        style = "fg:${base0A} bg:${base01}";
        format = "[$ssh_symbol$hostname]($style)";
      };
      directory = {
        format = "[$read_only$path]($style)";
        read_only = "!";
        style = "fg:${base0E} bg:${base01}";
      };
      git_branch = {
        format = "[$symbol$branch(:$remote_branch)]($style)";
        style = "fg:${base0D} bg:${base01}";
      };
      git_state = {
        format = "[\($state($progress_current/$progress_total)\)]($style)";
        style = "fg:${base03} bg:${base01}";
      };
      nix_shell = {
        format = "[$state(\($name\))]($style)";
        style = "fg:${base03}";
        impure_msg = "";
        pure_msg = "";
        heuristic = true;
      };
      character = {
        success_symbol = "";
        error_symbol = "[×](fg:${base08})";
        vimcmd_symbol = "[v](fg:${base0B})";
      };
      cmd_duration = {
        format = "[$duration]($style)";
        style = "fg:${base03}";
      };
    };
  };
}
