{ config, lib, ... }:

let
  cfg = config.luminosity.system.configurations.nixConfig;

in
{
  config = lib.mkIf cfg.enable {
    nix = {
      gc.automatic = true;
      optimise.automatic = true;

      settings = {
        experimental-features = [
          "nix-command"
          "flakes"
        ];
      };
    };
  };
}
