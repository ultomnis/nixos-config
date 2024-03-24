{
  programs.pandoc = {
    enable = true;

    # Options to set by default
    defaults = {
      pdf-engine = "tectonic";
    };
  };
}
