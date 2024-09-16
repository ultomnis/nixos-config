{ pkgs, ... }:

{
  programs.obs-studio = {
    enable = true;

    # Optional plugins
    plugins = with pkgs.obs-studio-plugins; [
      obs-backgroundremoval
      obs-tuna
    ];
  };
}
