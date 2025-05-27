{
  clue = {
    enable = true;
    setupOpts = {
      triggers = [
        {
          mode = "n";
          keys = "<leader>";
        }
        {
          mode = "n";
          keys = "g";
        }
        {
          mode = "n";
          keys = "z";
        }
      ];
    };
  };
  comment = {
    enable = true;
    setupOpts = {
      options = {
        ignore_blank_line = true;
        pad_comment_parts = false;
      };
      mappings = {
        comment_visual = "<C-/>";
        textobject = "<C-/>";
      };
    };
  };
  icons = {
    enable = true;
  };
  jump2d = {
    enable = true;
    setupOpts = {
      mappings = {
        start_jumping = "s";
      };
    };
  };
  notify = {
    enable = true;
  };
  pairs = {
    enable = true;
  };
  statusline = {
    enable = true;
  };
  tabline = {
    enable = true;
  };
}
