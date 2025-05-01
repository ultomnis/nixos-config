{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.programs.graphical.thunderbird;

in
{
  config = lib.mkIf cfg.enable {
    # Email client
    programs.thunderbird = {
      enable = true;

      package = pkgs.thunderbird.override {
        extraPolicies = {
          DisableTelemetry = true;
        };
      };

      profiles.default = {
        isDefault = true;

        search = {
          default = "ddg";
          privateDefault = "ddg";
          force = true;
        };
      };
    };
  };
}
