{
  lib,
  config,
  pkgs,
  hostname,
  userSettings,
  ...
}:
let
  inherit (lib) mkIf mkMerge;
  isDesktop = hostname == "nkdtop";
in
{
  imports = [
    ../modules/home
  ];

  home = {
    username = "${userSettings.username}";
    homeDirectory = "${userSettings.dirs.home}";
    packages = with pkgs; [
      pavucontrol
      nemo
      nemo-fileroller
      aseprite
      gcr # Provides org.gnome.keyring.SystemPrompter
    ];
    stateVersion = "24.11";
  };

  xdg.userDirs.enable = true;

  myHome = {
    windowManager.i3 = mkMerge [
      {
        enable = true;
      }
      (mkIf isDesktop {
        extraStartupPrograms = [
          { command = "(sleep 3 && vesktop)"; }
          { command = "spotify"; }
          { command = "steam"; }
          { command = "openrgb -m static -c cd3c0a"; }
          { command = "nvidia-settings --load-config-only"; }
        ];
      })
    ];
    theme.variant = "kanagawa";
    term.name = "wezterm";
    documents.enable = true;
    comms.discord.enable = true;
    vlc.enable = true;
    spotify = {
      cli.enable = true;
      gui.enable = true;
    };
    yazi.enable = true;
    webBrowser = {
      firefox.enable = true;
      brave.enable = isDesktop;
    };
    gimp.enable = isDesktop;
    print-3d.enable = isDesktop;
    torrentCatcher.enable = isDesktop;
    pruneDir = {
      enable = true;
      dirs = {
        downloads = {
          path = "${config.home.homeDirectory}/downloads";
        };
      };
    };
  };

  spec.home = {
    editor = {
      neovim = {
        enable = true;
        isDefaultEditor = true;
      };
      helix.enable = true;
    };

    git = {
      enable = true;
      gui = "lazygit";
    };
  };

  programs.home-manager.enable = true;
  services.gnome-keyring.enable = true;

  xsession.windowManager.i3.config.workspaceOutputAssign =
    let
      mkWorkspaceAssignments =
        output: workspaces:
        map (ws: {
          inherit output;
          workspace = toString ws;
        }) workspaces;
    in
    lib.mkIf (isDesktop && config.myHome.windowManager.i3.enable) (
      (mkWorkspaceAssignments "DP-4" (lib.range 1 4)) ++ (mkWorkspaceAssignments "DP-2" (lib.range 5 8))
    );
}
