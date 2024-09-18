{ pkgs, ... }:

{
  # Configure the theme for GTK applications
  gtk = {
    enable = true;

    iconTheme = {
      package = pkgs.whitesur-icon-theme;
      name = "WhiteSur";
    };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };
  };

  # Configure the theme for Qt applications
  qt = {
    enable = true;

    style = {
      name = "kvantum";
    };
  };

  # Cursor configuration
  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 24;
    gtk.enable = true;
    x11 = {
      enable = true;
      defaultCursor = "Adwaita";
    };
  };
}
