[
  {
    key = "<leader>Q";
    mode = "n";
    action = ":qa<CR>";
    desc = "Quit";
  }
  {
    key = "<C-s>";
    mode = "n";
    action = ":w<CR>";
  }
  {
    key = "<Tab>";
    mode = "n";
    action = ":bnext<CR>";
  }
  {
    key = "<C-Tab>";
    mode = "n";
    action = ":bprevious<CR>";
  }
  {
    key = "<leader>lf";
    mode = "n";
    lua = true;
    action = "function() require('conform').format() end";
    desc = "Format buffer";
  }
  {
    key = "-";
    mode = "n";
    action = ":Oil<CR>";
    desc = "Open oil file explorer";
  }
  {
    key = "q";
    mode = "n";
    action = "";
  }
]
