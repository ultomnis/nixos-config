{ extraConfig, pkgs, ... }:

{
  # Configure the theme for GTK applications
  gtk = {
    enable = true;

    theme = {
      package = pkgs.rose-pine-gtk-theme;
      name = "rose-pine";
    };

    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus";
    };
  } // extraConfig.gtk or { };
}
