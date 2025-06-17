{ config, pkgs, ... }:

let
  cfg = config.luminosity.home.programs.graphical.thunderbird;

in
{
  # Email client
  programs.thunderbird = {
    inherit (cfg) enable;

    package = pkgs.thunderbird.override {
      extraPolicies = {
        DisableTelemetry = true;
      };
    };

    profiles =
      cfg.profiles
      |> map (profile: {
        inherit (profile) name;

        value = {
          inherit (profile) isDefault;

          search = {
            default = "ddg";
            privateDefault = "ddg";
            force = true;
          };
        };
      })
      |> builtins.listToAttrs;
  };
}
