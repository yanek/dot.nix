{
  pkgs,
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
          whichKey = import ./which-key.nix;
          cheatsheet.enable = true;
          hardtime-nvim = {
            enable = true;
            setupOpts = {
              restriction_mode = "hint";
              disabled_keys = { };
            };
          };
        };

        clipboard = {
          enable = true;
          providers.xclip.enable = true;
          registers = "unnamedplus";
        };

        lsp = {
          enable = true;
          formatOnSave = true;
          nvim-docs-view.enable = true;
          trouble.enable = false;
          lspconfig = {
            enable = true;
            sources.fish-lsp = ''
              lspconfig.fish_lsp.setup {
                capabilities = capabilities;
                on_attach = default_on_attach;
                cmd = {"${getExe pkgs.fish-lsp}", "start"};
              }
            '';
          };
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
          smartcolumn = {
            enable = true;
            setupOpts = {
              colorcolumn = "80";
            };
          };
        };

        utility = {
          surround.enable = true;
          multicursors.enable = true;
          motion.flash-nvim.enable = true;
          yazi-nvim = import ./yazi-nvim.nix;
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
