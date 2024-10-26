{
  # Modal text editor
  programs.helix = {
    enable = true;
    defaultEditor = true;

    # Helix configuration
    settings = {
      theme = "rose_pine";

      editor = {
        line-number = "relative";
        lsp.display-messages = true;
      };
    };
  };
}
