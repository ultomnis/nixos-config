{
  # Resource monitor
  programs.btop = {
    enable = true;

    settings = {
      color_theme = "TTY";
      theme_background = false;
      rounded_corners = false;
      vim_keys = true;
    };
  };
}
