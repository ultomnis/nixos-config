{
  # Terminal file manager
  programs.yazi = {
    enable = true;
    enableFishIntegration = true;

    # yazi configuration
    settings = {
      manager = {
        sort_by = "natural";
        show_hidden = true;
      };
    };
  };
}
