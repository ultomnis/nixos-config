{ config, lib, ... }:

let
  cfg = config.luminosity.home.programs.terminal.zoxide;

in
{
  config = lib.mkIf cfg.enable {
    # Alternative to cd
    programs.zoxide = {
      enable = true;

      options = [
        "--cmd cd"
      ];
    };
  };
}
