{ config, lib, ... }:

let
  cfg = config.luminosity.home.desktop.configurations.variables;
  inherit (config.luminosity.home.selections) terminal;

in
{
  config = lib.mkIf cfg.enable {
    home.sessionVariables =
      lib.optionalAttrs (terminal != null) {
        TERMINAL = terminal;
      }
      // cfg.extraVariables;
  };
}
