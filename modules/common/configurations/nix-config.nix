{ config, lib, ... }:

let
  cfg = config.luminosity.modules.configurations.nixConfig;

in
{
  config = lib.mkIf cfg.enable {
    nix = {
      gc = {
        automatic = true;
        options = "--delete-older-than 30d";
      };

      optimise = {
        automatic = true;
      };

      settings = {
        experimental-features = [
          "flakes"
          "nix-command"
          "pipe-operators"
        ];
      };
    };
  };
}
