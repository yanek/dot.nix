{
  services.picom = {
    enable = true;
    fade = true;
    fadeDelta = 4;
    vSync = true;
    shadow = false;
    backend = "glx";

    opacityRules = [
      "90:class_g = 'Rofi'"
    ];

    settings = {
      blur = {
        method = "gaussian";
        size = 4;
        deviation = 5.0;
      };
      blur-background-exclude = [
        "class_g = 'slop'"
      ];
    };
  };
}
