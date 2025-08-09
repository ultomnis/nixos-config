{ config, ... }:

let
  cfg = config.luminosity.home.programs.cli.eza;

in
{
  # Alternative to ls
  programs.eza = {
    inherit (cfg) enable;
    git = true;
    icons = "auto";
  };
}
