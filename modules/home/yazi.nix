{
  config,
  lib,
  ...
}:
with lib; {
  options.myHome.yazi = {
    enable = mkEnableOption "yazi";
  };

  config.programs = mkIf config.myHome.yazi.enable {
    yazi = {
      enable = true;
      settings.manager = {
        ratio = [1 2 0];
        sort_by = "natural";
        sort_sensitive = false;
        sort_dir_first = true;
        sort_translit = true;
        linemode = "size";
      };
    };

    fish.functions = {
      # cd into directory on yazi exit
      y =
        # fish
        ''
          set tmp (mktemp -t "yazi-cwd.XXXXXX")
          ${pkgs.yazi}/bin/yazi $argv --cwd-file="$tmp"
          if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
            builtin cd -- "$cwd"
          end
          rm -f -- "$tmp"
        '';
    };
  };
}
