{ config, ... }:

let
  cfg = config.luminosity.home.programs.terminal.syncthing;

in
{
  # Continuous file synchronization program
  services.syncthing = {
    inherit (cfg) enable;

    settings = {
      devices = {
        arcturus = {
          addresses = [
            "tcp://arcturus"
          ];

          id = "H76G6KI-QPUKUJB-PIV7ACP-MCUHQU3-NWHMLJA-QXVRI3L-3VNRPBM-ZROJIAU";
        };

        sirius = {
          addresses = [
            "tcp://sirius"
          ];

          id = "DWKD25K-65DIH4P-VNPEUDE-FCKATZ4-YWG2IEB-PHICJCE-SUW33P4-WLGR5AT";
        };
      };

      folders = {
        "Sesame" = {
          devices = [
            "arcturus"
            "sirius"
          ];

          path = "${config.home.homeDirectory}/Sync/Sesame";

          versioning = {
            type = "staggered";
            params.maxAge = "1209600"; # 14 days in seconds
          };
        };
      };

      options = {
        globalAnnounceEnabled = false;
        localAnnounceEnabled = false;
        relaysEnabled = false;
        urAccepted = -1;
      };
    };
  };
}
