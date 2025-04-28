{ config, lib, ... }:

let
  cfg = config.luminosity.desktop.nixConfig;

in
{
  config = lib.mkIf cfg.enable {
    nix = {
      # Automated garbage collection for user-specific generations
      gc = {
        automatic = true;
        frequency = "weekly";
        options = "--delete-older-than 30d";
      };
    };
  };
}
