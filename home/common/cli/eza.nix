{ config, ... }:

let
  cfg = config.luminosity.home.cli.eza;

in
{
  # Alternative to ls
  programs.eza = {
    inherit (cfg) enable;
    git = true;
    icons = "auto";
  };
}
