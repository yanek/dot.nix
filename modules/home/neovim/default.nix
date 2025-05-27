{
  config,
  lib,
  ...
}:
with lib; {
  options.myHome.neovim = {
    enable = mkEnableOption "neovim";
    isDefaultEditor = mkOption {
      default = false;
      type = types.bool;
    };
  };

  config = mkIf config.myHome.neovim.enable {
    programs.nvf = {
      enable = true;

      settings.vim = {
        viAlias = true;
        vimAlias = true;
        preventJunkFiles = true;
        lsp.enable = true;

        options = import ./options.nix;
        languages = import ./languages.nix;

        telescope.enable = true;
        autocomplete.nvim-cmp.enable = true;
        treesitter = import ./treesitter.nix;
        filetree = import ./filetree.nix;
        diagnostics = import ./diagnostics.nix;
        formatter = import ./formatter.nix;
        keymaps = import ./keymaps.nix;
        mini = import ./mini.nix;

        globals = {
          tex_flavor = "latex";
        };
      };
    };

    home.sessionVariables = mkIf config.myHome.neovim.isDefaultEditor {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
  };
}
