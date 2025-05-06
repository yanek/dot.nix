{...}: {
  wayland.windowManager.sway.config = {
    workspaceAutoBackAndForth = true;

    # Assign windows to workspaces
    assigns = {
      "2" = [{class = "^steam$";}];
      "5" = [{class = "^WebCord$";}];
    };

    # Window specific rules
    window.commands = [
      {
        command = "floating enable";
        criteria.class = "Lxappearance";
      }
      {
        command = "floating enable";
        criteria.app_id = "org.gnome.Calculator";
      }
      {
        command = "floating enable";
        criteria.window_role = "pop-up";
      }
    ];
  };
}
