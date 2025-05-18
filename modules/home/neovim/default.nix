{
  config,
  lib,
  ...
}:
with lib; {
  options.myHome.neovim = {
    enable = mkEnableOption "neovim";
  };

  config.programs.nvf = mkIf config.myHome.neovim.enable {
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
}
