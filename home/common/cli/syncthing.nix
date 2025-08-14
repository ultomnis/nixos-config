{ config, ... }:

let
  cfg = config.luminosity.home.cli.syncthing;

in
{
  # Continuous file synchronization program
  services.syncthing = {
    inherit (cfg) enable;

    settings = {
      options = {
        urAccepted = -1;
      };
    };
  };
}
