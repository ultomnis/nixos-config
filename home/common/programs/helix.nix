{
  # Modal text editor
  programs.helix = {
    enable = true;
    defaultEditor = true;

    # Helix configuration
    settings = {
      theme = "dracula";

      editor = {
        line-number = "relative";
        lsp.display-messages = true;
      };
    };
  };
}
