{
  # Alternative to cd
  programs.zoxide = {
    enable = true;

    options = [
      "--cmd cd"
    ];
  };
}
