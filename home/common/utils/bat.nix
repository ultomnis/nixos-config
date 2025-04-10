{
  # Alternative to cat
  programs.bat = {
    enable = true;

    config = {
      theme = "base16";
      squeeze-blank = true;
      squeeze-limit = "1";
    };
  };
}
