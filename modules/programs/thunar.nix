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

  # Mounting and trash functionality
  services.gvfs.enable = true;
}
