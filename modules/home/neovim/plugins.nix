{ pkgs }:
{
  lazy.plugins = with pkgs.vimPlugins; {
    "tiny-inline-diagnostic.nvim" = {
      package = tiny-inline-diagnostic-nvim;
      setupModule = "tiny-inline-diagnostic";
      setupOpts = {
        preset = "powerline";
      };
      event = [ "LspAttach" ];
    };
    "oil.nvim" = {
      package = oil-nvim;
      setupModule = "oil";
      setupOpts = {
        default_file_explorer = true;
      };
      cmd = [ "Oil" ];
    };
    "zenbones.nvim" = {
      package = zenbones-nvim;
      lazy = false;
    };
    "lush.nvim" = {
      package = lush-nvim;
      lazy = false;
    };
  };
}
