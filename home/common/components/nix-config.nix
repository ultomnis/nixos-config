{
  nix = {
    # Automated garbage collection for user-specific generations
    gc = {
      automatic = true;
      frequency = "weekly";
      options = "--delete-older-than 30d";
    };
  };
}
