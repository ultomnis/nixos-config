{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.system.configurations.nixConfig;
  inherit (pkgs.stdenv) isDarwin isLinux;

in
{
  config = lib.mkIf cfg.enable {
    nix = {
      gc =
        {
          automatic = true;
          options = "--delete-older-than 30d";
        }
        // lib.optionalAttrs isLinux {
          dates = "weekly";
        }
        // lib.optionalAttrs isDarwin {
          interval = [
            {
              Hour = 0;
              Minute = 0;
              Weekday = 1;
            }
          ];
        };

      optimise =
        {
          automatic = true;
        }
        // lib.optionalAttrs isLinux {
          dates = [
            "weekly"
          ];
        }
        // lib.optionalAttrs isDarwin {
          interval = [
            {
              Hour = 0;
              Minute = 0;
              Weekday = 1;
            }
          ];
        };

      settings = {
        experimental-features = [
          "nix-command"
          "flakes"
        ];
      };
    };
  };
}
