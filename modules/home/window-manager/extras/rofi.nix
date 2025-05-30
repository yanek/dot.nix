{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.myHome.windowManager.extras.rofi;
in
{
  options.myHome.windowManager.extras.rofi = {
    enable = mkEnableOption "rofi";
  };

  config = mkIf cfg.enable {
    programs.rofi = {
      enable = true;
      terminal = config.myHome.term.command;
      theme =
        let
          inherit (config.lib.formats.rasi) mkLiteral;
        in
        {
          window = {
            location = mkLiteral "center";
            anchor = mkLiteral "north";
            fullscreen = false;
            width = mkLiteral "400px";
            x-offset = mkLiteral "0px";
            y-offset = mkLiteral "-255px";
          };
          mainbox = {
            enabled = true;
            spacing = mkLiteral "0px";
            margin = mkLiteral "0px";
            padding = mkLiteral "8px";
            border = mkLiteral "1px solid";
            border-radius = mkLiteral "0px 0px 0px 0px";
            children = [
              "inputbar"
              "message"
              "listview"
            ];
          };
          inputbar = {
            enabled = true;
            margin = mkLiteral "0px 0px 8px 0px";
            padding = mkLiteral "0px";
            border = mkLiteral "0px";
            border-radius = mkLiteral "0px";
            children = [
              "prompt"
              "textbox-prompt-colon"
              "entry"
            ];
          };
          prompt = {
            enabled = true;
          };
          textbox-prompt-colon = {
            enable = true;
            expand = false;
            str = ":";
          };
          entry = {
            enabled = true;
            cursor = mkLiteral "text";
            placeholder = "search...";
          };
          listview = {
            enabled = true;
            columns = 1;
            lines = 10;
            cycle = true;
            dynamic = true;
            scrollbar = false;
            layout = mkLiteral "vertical";
            reverse = false;
            fixed-height = false;
            fixed-columns = true;
            spacing = mkLiteral "0px";
            margin = mkLiteral "0px";
            padding = mkLiteral "0px";
            border = mkLiteral "0px solid";
            border-radius = mkLiteral "0px";
            cursor = "default";
          };
          element = {
            enabled = true;
            spacing = mkLiteral "0px";
            margin = mkLiteral "0px";
            padding = mkLiteral "0px";
            cursor = mkLiteral "pointer";
          };
        };
    };
    programs.rbw = {
      enable = true;
      settings = {
        pinentry = pkgs.pinentry-rofi;
        email = "ksianoe@gmail.com";
      };
    };
    home.packages = with pkgs; [
      rofi-rbw
    ];
  };
}
