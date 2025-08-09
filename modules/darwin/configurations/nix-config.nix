{ config, lib, ... }:

let
  cfg = config.luminosity.modules.system.configurations.nixConfig;

in
{
  config = lib.mkIf cfg.enable {
    nix = {
      gc = {
        interval = lib.singleton {
          Hour = 0;
          Minute = 0;
          Weekday = 1;
        };
      };

      optimise = {
        interval = lib.singleton {
          Hour = 0;
          Minute = 0;
          Weekday = 1;
        };
      };
    };
  };
}
