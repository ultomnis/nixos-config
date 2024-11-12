{ pkgs, ... }:

{
  programs.obs-studio = {
    enable = true;
    enableVirtualCamera = true;

    # Optional plugins
    plugins = with pkgs.obs-studio-plugins; [
      obs-move-transition
    ];
  };
}
