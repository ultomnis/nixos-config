{ config, lib, ... }:

let
  cfg = config.luminosity.home.desktop.configurations.variables;
  inherit (config.luminosity.home.selections) terminal;

in
{
  config = lib.mkIf cfg.enable {
    home.sessionVariables = {
      TERMINAL = lib.mkIf (terminal != null) terminal;
    } // cfg.extraVariables;
  };
}
