{
  # Configure the theme for GTK applications
  gtk = {
    enable = true;

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };
  };
}
