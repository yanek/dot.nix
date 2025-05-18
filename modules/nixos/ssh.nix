{ userSettings, pkgs, ... }:

let
  sshKeys = pkgs.fetchurl {
    url = "https://github.com/yanek.keys";
    hash = "sha256-7fqdidKx7QWv6C2Y83k5y8GU8g0NUON1ZYgTe0XSiG0=";
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
