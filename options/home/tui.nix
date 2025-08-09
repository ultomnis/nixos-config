{ config, lib, ... }:

let
  inherit (lib)
    mkOption
    types
    ;

  mkTuiOption =
    name:
    mkOption {
      type = types.bool;
      default = config.luminosity.home.tui.enable;
      description = "Whether to enable ${name}.";
    };

in
{
  options.luminosity.home.tui = {
    btop.enable = mkTuiOption "btop";
    helix.enable = mkTuiOption "Helix";
    kew.enable = mkTuiOption "kew";
    micro.enable = mkTuiOption "micro";
    yazi.enable = mkTuiOption "Yazi";
  };
}
