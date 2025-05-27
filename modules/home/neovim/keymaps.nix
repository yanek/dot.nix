[
  {
    key = "<leader>e";
    mode = "n";
    action = ":Neotree toggle<CR>";
    desc = "Toggle Neotree";
  }
  {
    key = "<C-e>";
    mode = "n";
    action = ":Neotree<CR>";
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
]
