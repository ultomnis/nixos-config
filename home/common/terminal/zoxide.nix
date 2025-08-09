{ config, ... }:

let
  cfg = config.luminosity.home.programs.terminal.zoxide;

in
{
  # Alternative to cd
  programs.zoxide = {
    inherit (cfg) enable;

    options = [
      "--cmd cd"
    ];
  };
}
