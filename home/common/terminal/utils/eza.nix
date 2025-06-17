{ config, ... }:

let
  cfg = config.luminosity.home.programs.terminal.eza;

in
{
  # Alternative to ls
  programs.eza = {
    inherit (cfg) enable;
    git = true;
    icons = "auto";
  };
}
