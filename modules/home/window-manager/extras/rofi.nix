{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.myHome.windowManager.extras.rofi;
in {
  options.myHome.windowManager.extras.rofi = {
    enable = mkEnableOption "rofi";
  };

  config = mkIf cfg.enable {
    programs.rofi = {
      enable = true;
      terminal = config.myHome.term.command;
      theme = let
        inherit (config.lib.formats.rasi) mkLiteral;
      in {
        window = {
          location = mkLiteral "center";
          anchor = mkLiteral "center";
          fullscreen = false;
          width = mkLiteral "1000px";
          x-offset = mkLiteral "0px";
          y-offset = mkLiteral "0px";
        };
        mainbox = {
          enabled = true;
          spacing = mkLiteral "10px";
          margin = mkLiteral "0px";
          padding = mkLiteral "40px";
          border = mkLiteral "0px solid";
          border-radius = mkLiteral "0px 0px 0px 0px";
          children = ["inputbar" "message" "listview"];
        };
        inputbar = {
          enabled = true;
          spacing = mkLiteral "10px";
          margin = mkLiteral "0px";
          padding = mkLiteral "0px 5px";
          border = mkLiteral "0px";
          border-radius = mkLiteral "0px";
          children = ["prompt" "textbox-prompt-colon" "entry"];
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
          columns = 3;
          lines = 10;
          cycle = true;
          dynamic = true;
          scrollbar = false;
          layout = mkLiteral "vertical";
          reverse = false;
          fixed-height = true;
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
          spacing = mkLiteral "10px";
          margin = mkLiteral "0px";
          padding = mkLiteral "5px";
          cursor = mkLiteral "pointer";
        };
      };
    };
  };
}
