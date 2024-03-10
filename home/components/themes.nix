{ pkgs, ... }:

{
  # Configure the theme for GTK applications
  gtk = {
    enable = true;

    theme = {
      name = "Breeze-Dark";
      package = pkgs.libsForQt5.breeze-gtk;
    };
  };

  # Configure the theme for Qt applications
  qt = {
    enable = true;
    platformTheme = "gtk";
  };
}
