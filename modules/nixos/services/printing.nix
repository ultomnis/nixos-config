{ config, lib, ... }:

let
  cfg = config.luminosity.system.services.printing;

in
{
  config = lib.mkIf cfg.enable {
    # Local print service
    services.printing = {
        enable = true;
        stateless = true;
      };
    };
  };
}
