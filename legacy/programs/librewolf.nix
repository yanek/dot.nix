{ inputs, userSettings, ... }:

{
  imports = [ inputs.betterfox.homeManagerModules.betterfox ];

  stylix.targets."librewolf".profileNames = [ userSettings.username ];

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
