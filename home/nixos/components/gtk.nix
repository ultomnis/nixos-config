{ pkgs, vars, ... }:

{
  # Configure the theme for GTK applications
  gtk = {
    enable = true;

    font = {
      name = "Hack Nerd Font Propo";
      size = vars.fontSize;
    };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };

    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus";
    };
  };
}
