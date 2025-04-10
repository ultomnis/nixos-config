{
  # Alternative to grep
  programs.ripgrep = {
    enable = true;

    arguments = [
      "--glob=!.git/"
      "--max-columns=150"
      "--max-columns-preview"
      "--smart-case"
    ];
  };
}
