{ config, lib, ... }:

let
  cfg = config.luminosity.programs.terminal.eza;

in
{
  config = lib.mkIf cfg.enable {
    # Alternative to ls
    programs.eza = {
      enable = true;
      git = true;
      icons = "auto";
    };
  };
}
