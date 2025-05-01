{ config, lib, ... }:

let
  cfg = config.luminosity.home.programs.terminal.eza;

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
