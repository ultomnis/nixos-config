{ config, ... }:

let
  cfg = config.luminosity.home.programs.cli.syncthing;

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

        canopus = {
          addresses = [
            "tcp://canopus"
          ];

          id = "UZVL5ZY-ESPYKYK-P2UCUWR-EVNJMKQ-B3OOBIU-NGY5TXN-EHL65C5-GO64NQL";
        };

        sirius = {
          addresses = [
            "tcp://sirius"
          ];

          id = "DWKD25K-65DIH4P-VNPEUDE-FCKATZ4-YWG2IEB-PHICJCE-SUW33P4-WLGR5AT";
        };
      };

      folders = {
        "Media" = {
          devices = [
            "arcturus"
            "canopus"
            "sirius"
          ];

          path = "${config.home.homeDirectory}/Sync/Media";

          versioning = {
            type = "trashcan";
            params.cleanoutDays = "14";
          };
        };

        "Notes" = {
          devices = [
            "arcturus"
            "canopus"
            "sirius"
          ];

          path = "${config.home.homeDirectory}/Sync/Notes";

          versioning = {
            type = "simple";

            params = {
              cleanoutDays = "14";
              keep = "5";
            };
          };
        };

        "Sesame" = {
          devices = [
            "arcturus"
            "canopus"
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
