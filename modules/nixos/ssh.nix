{
  config,
  userSettings,
  pkgs,
  ...
}:

let
  sshKeys = pkgs.fetchurl {
    url = "https://github.com/yanek.keys";
    hash = "sha256-7fqdidKx7QWv6C2Y83k5y8GU8g0NUON1ZYgTe0XSiG0=";
  };
  uid = 1000;
  user = userSettings.username;
in
{
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
    };
  };

  programs.ssh = {
    startAgent = true;
  };

  users.users.${user} = {
    inherit uid;
    openssh.authorizedKeys.keyFiles = [ sshKeys ];
  };

  environment.sessionVariables = {
    SSH_AUTH_SOCK = "/run/user/${builtins.toString uid}/ssh-agent";
  };

  systemd.user.services = {
    # This ensures that the ssh key is added to the agent each time we login.
    # It's needed for tools like `gitui` to be able to push, for some reason.
    # https://github.com/gitui-org/gitui/issues/495
    ssh-add-key = {
      wantedBy = [ "default.target" ];
      after = [ "ssh-agent.service" ];
      serviceConfig = {
        Type = "oneshot";
        ExecStartPre = "${pkgs.uutils-coreutils-noprefix}/bin/sleep 1";
        ExecStart = [
          "${pkgs.openssh}/bin/ssh-add ${config.users.users.${user}.home}/.ssh/id_ed25519"
        ];
        Restart = "on-failure";
        RestartSec = 1;
      };
    };
  };
}
