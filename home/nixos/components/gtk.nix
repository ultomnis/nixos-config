{ pkgs, ... }:

{
  # Configure the theme for GTK applications
  gtk = {
    enable = true;

    iconTheme = {
      package = pkgs.kora-icon-theme;
      name = "kora";
    };
  };
}
