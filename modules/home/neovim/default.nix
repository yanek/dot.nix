{
  config,
  lib,
  ...
}:
with lib;
{
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

        options = import ./options.nix;
        languages = import ./languages.nix;

        binds = {
          whichKey.enable = true;
          cheatsheet.enable = true;
          hardtime-nvim.enable = true;
        };

        clipboard = {
          enable = true;
          providers.xclip.enable = true;
          registers = "unnamedplus";
        };

        lsp = {
          enable = true;
          formatOnSave = true;
          lspconfig.enable = true;
          nvim-docs-view.enable = true;
          trouble.enable = false;
        };

        visuals = {
          nvim-cursorline.enable = true;
          fidget-nvim.enable = true;
          indent-blankline.enable = true;
          nvim-web-devicons.enable = true;
          highlight-undo.enable = true;
        };

        ui = {
          borders.enable = true;
          colorizer.enable = true;
          illuminate.enable = true;
          smartcolumn = {
            enable = true;
            setupOpts = {
              colorcolumn = "100";
            };
          };
        };

        utility = {
          surround.enable = true;
          multicursors.enable = true;
          motion.flash-nvim.enable = true;
        };

        telescope = {
          enable = true;
        };

        autocomplete = {
          nvim-cmp.enable = false;
          blink-cmp.enable = true;
        };

        formatter = {
          conform-nvim.enable = true;
        };

        treesitter = import ./treesitter.nix;
        filetree = import ./filetree.nix;
        diagnostics = import ./diagnostics.nix;
        keymaps = import ./keymaps.nix;
        mini = import ./mini.nix;

        autocmds = [
          {
            event = [ "VimEnter" ];
            desc = "Hides the EndOfBuffer character (~)";
            callback =
              generators.mkLuaInline
                # lua
                ''
                  function()
                    vim.opt.fillchars = { eob = ' ' }
                  end
                '';
            once = true;
          }
        ];

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
