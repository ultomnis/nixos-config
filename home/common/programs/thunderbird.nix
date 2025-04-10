{ pkgs, ... }:

{
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
}
