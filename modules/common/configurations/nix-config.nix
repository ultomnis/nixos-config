{
  config,
  lib,
  systemOS,
  ...
}:

let
  cfg = config.luminosity.system.configurations.nixConfig;

in
{
  config = lib.mkIf cfg.enable {
    nix = {
      gc =
        {
          automatic = true;
          options = "--delete-older-than 30d";
        }
        |> lib.recursiveUpdate (
          lib.optionalAttrs (systemOS == "linux") {
            dates = "weekly";
          }
        )
        |> lib.recursiveUpdate (
          lib.optionalAttrs (systemOS == "darwin") {
            interval = [
              {
                Hour = 0;
                Minute = 0;
                Weekday = 1;
              }
            ];
          }
        );

      optimise =
        {
          automatic = true;
        }
        |> lib.recursiveUpdate (
          lib.optionalAttrs (systemOS == "linux") {
            dates = [
              "weekly"
            ];
          }
        )
        |> lib.recursiveUpdate (
          lib.optionalAttrs (systemOS == "darwin") {
            interval = [
              {
                Hour = 0;
                Minute = 0;
                Weekday = 1;
              }
            ];
          }
        );

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
