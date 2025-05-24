{
  lib,
  config,
  ...
}:
with lib; {
  programs.starship = with config.lib.stylix.colors.withHashtag; {
    enable = true;
    enableFishIntegration = true;
    enableBashIntegration = true;
    enableTransience = true;
    settings = {
      format = concatStrings [
        "$username"
        "$hostname"
        "$directory"
        "$git_branch"
        "$git_state"
        "$character"
      ];
      right_format = concatStrings [
        "$cmd_duration"
      ];
      username = {
        show_always = false;
        format = "[ $user ]($style)";
        style_user = "${base05} bg:${base01}";
        style_root = "${base08} bg:${base01}";
      };
      hostname = {
        ssh_only = true;
        style = "fg:${base0A} bg:${base01}";
        format = "[ $ssh_symbol$hostname ]($style)";
      };
      directory = {
        format = "[ $read_only$path ]($style)";
        read_only = "!";
        style = "fg:${base0E} bg:${base01}";
      };
      git_branch = {
        format = "[ $symbol$branch(:$remote_branch) ]($style)";
        style = "fg:${base0D} bg:${base01}";
      };
      git_state = {
        format = "[ \($state( $progress_current/$progress_total)\) ]($style)";
        style = "fg:${base03} bg:${base01}";
      };
      character = {
        success_symbol = "[ ](bg:${base02})";
        error_symbol = "[ ](bg:${base08})";
        vimcmd_symbol = "[ ](bg:${base0B})";
      };
      cmd_duration = {
        format = "[$duration]($style)";
        style = "fg:${base03}";
      };
    };
  };
}
