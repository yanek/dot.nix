{...}: {
  wayland.windowManager.sway.config = {
    workspaceAutoBackAndForth = true;

    # Assign windows to workspaces
    assigns = {
      "2" = [{class = "^steam$";}];
      "5" = [{class = "^WebCord$";}];
      "6" = [{class = "^Spotify$";}];
    };

    # Window specific rules
    window.commands = [
      {
        command = "floating enable";
        criteria.app_id = "org.gnome.Calculator";
      }
      {
        command = "floating enable";
        criteria.window_role = "pop-up";
      }
      {
        command = "floating enable";
        criteria.window_role = "bubble";
      }
      {
        command = "floating enable";
        criteria.window_role = "dialog";
      }
      {
        command = "floating enable";
        criteria.window_type = "dialog";
      }
      {
        command = "floating enable";
        criteria.title = "(?:Open|Save) (?:File|Folder|As)";
      }

      # Inhibit idle when any app is fullscreen
      {
        command = "inhibit_idle fullscreen";
        criteria.app_id = ".*";
      }
      {
        command = "inhibit_idle fullscreen";
        criteria.class = ".*";
      }
    ];
  };
}
