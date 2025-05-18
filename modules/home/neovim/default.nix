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

      settings = {
        imports = [
          ./options.nix
          ./languages.nix
          ./treesitter.nix
        ];
        vim = {
          viAlias = true;
          vimAlias = true;
          lsp.enable = true;
        };
      };
    };

    home.sessionVariables = mkIf config.myHome.neovim.isDefaultEditor {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
  };
}
