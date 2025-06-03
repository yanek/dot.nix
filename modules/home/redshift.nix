{
  services.redshift = {
    enable = true;
    tray = true;
    provider = "manual";
    latitude = "48.8533495";
    longitude = "2.348392";
    dawnTime = "06:00-08:00";
    duskTime = "18:00-20:00";
    temperature = {
      day = 6500;
      night = 3400;
    };
  };
}
