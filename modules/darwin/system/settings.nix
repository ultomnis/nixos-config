{
  # Auto upgrade nix package and the daemon service
  services.nix-daemon.enable = true;

  nix = {
    # Experimental features
    settings.experimental-features = "nix-command flakes";

    # Garbage collection
    gc = {
      automatic = true;
      user = "user";
      interval = {
        Hour = 0;
        Minute = 0;
        Weekday = 1; # Monday
      };
    };
  };
}
