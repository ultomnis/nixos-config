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

      profiles =
        cfg.profiles
        |> map (profile: {
          name = profile.name;

          value = {
            isDefault = profile.isDefault;

            search = {
              default = "ddg";
              privateDefault = "ddg";
              force = true;
            };
          };
        })
        |> builtins.listToAttrs;
    };
  };
}
