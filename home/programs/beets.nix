{
  # Music library manager
  programs.beets = {
    enable = true;

    # beets configuration
    settings = {
      plugins = [
        "embedart"
        "fetchart"
        "fromfilename"
        "scrub"
      ];
    
      asciify_paths = "yes";
      original_date = "yes";
    };
  };
}
