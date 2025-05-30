{
  config,
  lib,
  ...
}:
with lib;
{
  options.mySystem.audio = {
    enable = mkEnableOption "audio";
  };

  config = mkIf config.mySystem.audio.enable {
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
  };
}
