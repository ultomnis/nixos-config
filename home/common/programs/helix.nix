{
  # Modal text editor
  programs.helix = {
    enable = true;
    defaultEditor = true;

    # Helix configuration
    settings = {
      theme = "default_transparent";

      editor = {
        line-number = "relative";
        lsp.display-messages = true;
      };
    };

    # Helix theme
    themes = {
      default_transparent = {
        "inherits" = "default";
        "ui.background" = {};
      };
    };
  };
}
