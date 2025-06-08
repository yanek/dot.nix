{
  config,
  pkgs,
  lib,
  hostname,
}:
let
  inherit (lib) getExe getExe';
  inherit (config.stylix) fonts;
  colors = config.lib.stylix.colors.withHashtag;
  blocksConfig = config.xdg.configFile."i3blocks/main".source;
  isLaptop = hostname == "nkltop";
  mkLaptopSpecific = laptop: data: if (isLaptop == laptop) then data else { };

in
{
  i3bars = [
    {
      id = "main";
      position = "top";
      statusCommand = "2>/tmp/i3blocks.err ${getExe pkgs.i3blocks} -vvv -c ${blocksConfig} | tee /tmp/i3blocks.out";
      trayOutput = "primary";

      colors = {
        background = colors.base00;
        statusline = colors.base05;
        focusedWorkspace = {
          background = colors.base04;
          border = colors.base04;
          text = colors.base00;
        };
        activeWorkspace = {
          background = colors.base02;
          border = colors.base02;
          text = colors.base03;
        };
        inactiveWorkspace = {
          background = colors.base00;
          border = colors.base00;
          text = colors.base03;
        };
        urgentWorkspace = {
          background = colors.base09;
          border = colors.base09;
          text = colors.base01;
        };
      };

      fonts = {
        names = [
          fonts.monospace.name
          "Font Awesome 6 Brands"
          "Font Awesome 6 Free Solid"
          "Font Awesome 6 Free"
        ];
        style = "Regular";
        size = builtins.toString fonts.sizes.desktop;
      };

      extraConfig = ''
        padding 0 8px
        separator_symbol "|"
      '';
    }
  ];

  i3blocks = {
    main = lib.hm.dag.entriesAnywhere "blocks" [
      # window title
      {
        command = "${getExe pkgs.xtitle} -s -t 50";
        interval = "persist";
      }
      # volume
      {
        command = "${getExe' pkgs.wireplumber "wpctl"} get-volume @DEFAULT_AUDIO_SINK@";
        interval = 1;
      }
      # net interface(s) status
      {
        command = "${getExe pkgs.myScripts.status_net}";
        interval = 10;
      }
      # battery
      (mkLaptopSpecific true {
        command = "${getExe pkgs.myScripts.status_battery}";
        interval = 30;
      })
      # full date
      {
        command = "date +%F";
        interval = 60;
      }
      # time
      {
        command = "date +%T";
        interval = 1;
      }
    ];
  };

  extraPackages = [
    pkgs.font-awesome
  ];
}
