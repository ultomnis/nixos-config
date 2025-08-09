{ config, lib, ... }:

let
  cfg = config.luminosity.modulessystem.configurations.nixConfig;

in
{
  config = lib.mkIf cfg.enable {
    nix = {
      gc = {
        dates = "weekly";
      };

      optimise = {
        dates = [
          "weekly"
        ];
      };
    };
  };
}
