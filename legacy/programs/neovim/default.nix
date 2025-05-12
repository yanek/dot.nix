{
  programs.nvf = {
    enable = true;

    settings = {
      imports = [./options.nix ./languages.nix ./treesitter.nix];
      vim = {
        viAlias = true;
        vimAlias = true;
        lsp.enable = true;
      };
    };
  };
}
