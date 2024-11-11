{systemConfig}: {
  time.timeZone = systemConfig.timezone;

  i18n.defaultLocale = systemConfig.locale;
  i18n.extraLocaleSettings = with systemConfig; {
    LC_ADDRESS = locale;
    LC_IDENTIFICATION = locale;
    LC_MEASUREMENT = locale;
    LC_MONETARY = locale;
    LC_NAME = locale;
    LC_NUMERIC = locale;
    LC_PAPER = locale;
    LC_TELEPHONE = locale;
    LC_TIME = locale;
  };

  services.xserver.xkb.layout = "us";
}
