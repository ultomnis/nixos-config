{ config, ... }:

let
  cfg = config.luminosity.home.cli.ripgrep;

in
{
  # Alternative to grep
  programs.ripgrep = {
    inherit (cfg) enable;

    arguments = [
      "--glob=!.git/"
      "--max-columns=150"
      "--max-columns-preview"
      "--smart-case"
    ];
  };
}
