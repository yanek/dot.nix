{
  pkgs,
  config,
  lib,
  ...
}:
let
  cfg = config.spec.home.editor.neovim;
in
{
  options.spec.home.editor.neovim =
    let
      inherit (lib) mkOption mkEnableOption;
    in
    {
      enable = mkEnableOption "neovim";
      isDefaultEditor = mkOption {
        default = false;
        type = lib.types.bool;
      };
    };

  config =
    let
      inherit (lib) mkIf mkMerge getExe;
      customPlugins = import ./plugins.nix { inherit pkgs; };
    in
    mkIf cfg.enable {
      programs.nvf = {
        enable = true;

        settings.vim = mkMerge [
          {
            viAlias = true;
            vimAlias = true;
            preventJunkFiles = true;

            options = import ./options.nix;
            languages = import ./languages.nix;

            binds = {
              whichKey = import ./which-key.nix;
              cheatsheet.enable = true;
              hardtime-nvim = {
                enable = false;
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

            git = {
              gitsigns.enable = true;
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
                enable = false;
                setupOpts = {
                  colorcolumn = "80";
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
              nvim-cmp.enable = true;
              blink-cmp.enable = false;
            };

            formatter = {
              conform-nvim = {
                enable = true;
                setupOpts = {
                  formatters_by_ft.javascript = [ "prettierd" ];
                };
              };
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
                  lib.generators.mkLuaInline
                    # lua
                    ''
                      function()
                        vim.opt.fillchars = { eob = ' ' }
                      end
                    '';
                once = true;
              }
              {
                event = [ "ColorScheme" ];
                desc = "Makes the background transparent";
                command = "highlight Normal ctermbg=NONE guibg=NONE";
              }
            ];

            globals = {
              tex_flavor = "latex";
            };
          }
          customPlugins
        ];

      };

      home.sessionVariables = mkIf cfg.isDefaultEditor {
        EDITOR = "nvim";
        VISUAL = "nvim";
      };
    };
}
