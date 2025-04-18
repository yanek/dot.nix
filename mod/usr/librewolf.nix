{ inputs, ... }:

{
  imports = [ inputs.betterfox.homeManagerModules.betterfox ];

  programs.librewolf = {
    enable = true;
    betterfox = {
      enable = false;
      settings = {
        enable = true;
        enableAllSections = true;
      };
    };
  };
}
