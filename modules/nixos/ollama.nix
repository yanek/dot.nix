{
  config,
  lib,
  ...
}:
with lib; {
  options.mySystem.ollama = {
    enable = mkEnableOption "ollama";
  };

  config = mkIf config.mySystem.ollama.enable {
    services = {
      ollama = {
        enable = true;
        acceleration = "cuda";
        loadModels = ["llama3.2:3b"];
      };
      open-webui = {
        enable = true;
        port = 1143;
      };
    };
  };
}
