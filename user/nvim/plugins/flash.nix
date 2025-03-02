{
  plugins.flash = {
    enable = true;
    autoLoad = true;
  };

  keymaps = [
    {
      mode = [
        "n"
        "x"
        "o"
      ];
      key = "s";
      action.__raw = "function() require('flash').jump() end";
    }
  ];
}
