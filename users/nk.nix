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
      xfce.thunar
      pavucontrol
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
        windowGap = 16;
        extraStartupPrograms = [
          { command = "(sleep 3 && vesktop)"; }
          { command = "steam"; }
          { command = "openrgb -m static -c cd3c0a"; }
          { command = "nvidia-settings --load-config-only"; }
        ];

      })
    ];
    theme.variant = "rose-pine";
    term.name = "wezterm";
    git = {
      enable = true;
      gui = "lazygit";
    };
    documents.enable = true;
    comms.discord.enable = true;
    vlc.enable = true;
    spotify.cli.enable = true;
    yazi.enable = true;
    neovim = {
      enable = true;
      isDefaultEditor = true;
    };
    web-browser = {
      firefox.enable = true;
      brave.enable = isDesktop;
    };
    gimp.enable = isDesktop;
    print-3d.enable = isDesktop;
  };

  programs.home-manager.enable = true;
  services.gnome-keyring.enable = true;

  xsession.windowManager.i3.config.workspaceOutputAssign =
    lib.mkIf (isDesktop && config.myHome.windowManager.i3.enable)
      [
        {
          output = "DP-4";
          workspace = "1";
        }
        {
          output = "DP-4";
          workspace = "2";
        }
        {
          output = "DP-4";
          workspace = "3";
        }
        {
          output = "DP-4";
          workspace = "4";
        }
        {
          output = "DP-2";
          workspace = "5";
        }
        {
          output = "DP-2";
          workspace = "6";
        }
        {
          output = "DP-2";
          workspace = "7";
        }
        {
          output = "DP-2";
          workspace = "8";
        }
      ];
}
