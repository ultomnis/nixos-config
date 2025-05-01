{ config, lib, ... }:

let
  cfg = config.luminosity.home.programs.terminal.ripgrep;

in
{
  config = lib.mkIf cfg.enable {
    # Alternative to grep
    programs.ripgrep = {
      enable = true;

      arguments = [
        "--glob=!.git/"
        "--max-columns=150"
        "--max-columns-preview"
        "--smart-case"
      ];
    };
  };
}
