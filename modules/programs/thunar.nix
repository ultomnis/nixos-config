{ pkgs, ... }:

{
  # Xfce file manager
  programs.thunar = {
    enable = true;

    plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-volman
    ];
  };

  # Save preferences
  programs.xfconf.enable = true;

  # Mounting and trash functionality
  services.gvfs.enable = true;

  # Image thumbnails
  services.tumbler.enable = true;
}
