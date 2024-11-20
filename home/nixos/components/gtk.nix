{ pkgs, ... }:

{
  # Configure the theme for GTK applications
  gtk = {
    enable = true;

    font = {
      name = "Hack Nerd Font";
      size = 11;
    };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };

    iconTheme = {
      package = pkgs.kora-icon-theme;
      name = "kora";
    };
  };
}
