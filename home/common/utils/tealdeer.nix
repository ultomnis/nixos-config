{
  # Fast implementation of tldr
  programs.tealdeer = {
    enable = true;

    settings = {
      updates = {
        auto_update = true;
      };
    };
  };
}
