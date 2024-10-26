{ pkgs, ... }:

{
  # Configure the theme for GTK applications
  gtk = {
    enable = true;

    theme = {
      package = pkgs.rose-pine-gtk-theme;
      name = "rose-pine";
    };

    iconTheme = {
      package = pkgs.rose-pine-icon-theme;
      name = "rose-pine";
    };

    font = {
      name = "Hack Nerd Font";
      size = 11;
    };
  };

  # Cursor configuration
  home.pointerCursor = {
    package = pkgs.rose-pine-cursor;
    name = "BreezeX-RosePine-Linux";
    size = 24;
    gtk.enable = true;
    x11 = {
      enable = true;
      defaultCursor = "BreezeX-RosePine-Linux";
    };
  };
}
