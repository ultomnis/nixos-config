{
  nix = {
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