{ pkgs, ... }:

{
  # Configure the theme for GTK applications
  gtk = {
    enable = true;
    font.name = "Hack Nerd Font Propo";

    theme = {
      package = pkgs.rose-pine-gtk-theme;
      name = "rose-pine";
    };

    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus";
    };
  };
}
