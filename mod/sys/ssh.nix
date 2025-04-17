{ userSettings, ... }:

let
  sshKeys = builtins.fetchurl {
    url = "https://github.com/yanek.keys";
  };
in
{
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
    };
  };

  users.users.${userSettings.username}.openssh.authorizedKeys.keyFiles = [ sshKeys ];
}
