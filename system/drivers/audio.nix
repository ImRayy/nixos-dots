{
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;

  # Enable sound with pipewire
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.pipewire.extraConfig.pipewire = {
    "context.properties" = {
      "default.clock.rate" = 44100;
      "default.clock.allowed-rates" = [192000 48000 44100];
    };
  };
}
