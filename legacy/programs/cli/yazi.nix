{...}: {
  programs.yazi = {
    enable = true;
    settings.manager = {
      ratio = [1 2 0];
      sort_by = "natural";
      sort_sensitive = false;
      sort_dir_first = true;
      sort_translit = true;
      linemode = "size";
    };
  };
}
