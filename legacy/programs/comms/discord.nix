{...}: {
  programs.nixcord = {
    enable = true;

    discord = {
      enable = false;
    };

    vesktop = {
      enable = true;
    };

    config = {
      frameless = true;
      disableMinSize = true;
    };

    vesktopConfig = {
      plugins = {
        alwaysTrust = {
          enable = true;
          domain = true;
          file = true;
        };

        betterFolders = {
          enable = true;
          closeAllFolders = true;
          closeOthers = true;
        };

        clearURLs = {
          enable = true;
        };

        emoteCloner = {
          enable = true;
        };

        gameActivityToggle = {
          enable = true;
        };

        typingIndicator = {
          enable = true;
          includeCurrentChannel = true;
          indicatorMode = "both";
        };

        whoReacted = {
          enable = true;
        };
      };
    };
  };
}
