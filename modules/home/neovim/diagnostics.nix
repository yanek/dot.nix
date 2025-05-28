{
  enable = true;
  config = {
    signs = {
      text = {
        "vim.diagnostic.severity.ERROR" = "󰅚 ";
        "vim.diagnostic.severity.WARN" = "󰀪 ";
      };
    };

    update_in_insert = false;
    underline = true;
    virtual_lines = true;
    virtual_text = false;
  };
}
