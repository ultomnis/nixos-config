{
  # Music library manager
  programs.beets = {
    enable = true;

    # beets configuration
    settings = {
      asciify_paths = true;
      original_date = "yes";
    };
  };
}
