{
  nix = {
    # Experimental features
    settings.experimental-features = [ "nix-command" "flakes" ];

    # Automated garbage collection
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };
}

