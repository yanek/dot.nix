{ inputs, ... }:

{
  imports = [ inputs.betterfox.homeManagerModules.betterfox ];

  programs.librewolf = {
    enable = true;
    betterfox = {
      enable = true;
      settings = {
        enable = true;
        enableAllSections = true;
      };
    };
  };
}
