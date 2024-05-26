{
  # Music library manager
  programs.beets = {
    enable = true;

    # beets configuration
    settings = {
      asciify_paths = "yes";
      original_date = "yes";
    };
  };
}
