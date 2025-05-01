{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.programs.graphical.firefox;

in
{
  config = lib.mkIf cfg.enable {
    # Web browser
    programs.firefox = {
      enable = true;

      package = pkgs.firefox.override {
        # Set Firefox policies
        extraPolicies = {
          DisableFirefoxStudies = true;
          DisableFormHistory = true;
          DisablePocket = true;
          DisableTelemetry = true;
          DisplayBookmarksToolbar = "never";
          NoDefaultBookmarks = true;
          OfferToSaveLogins = false;
          SearchSuggestEnabled = false;

          EnableTrackingProtection = {
            Value = true;
            Locked = true;
            Cryptomining = true;
            Fingerprinting = true;
          };

          ExtensionSettings =
            let
              extensionSetting =
                extensionName: extraOptions:
                {
                  installation_mode = "force_installed";
                  install_url = "https://addons.mozilla.org/firefox/downloads/latest/${extensionName}/latest.xpi";
                }
                // extraOptions;
            in
            {
              "*" = {
                installation_mode = "blocked";
              };

              "{446900e4-71c2-419f-a6a7-df9c091e268b}" = extensionSetting "bitwarden-password-manager" { };

              "addon@darkreader.org" = extensionSetting "darkreader" { };

              "uBlock0@raymondhill.net" = extensionSetting "ublock-origin" {
                private_browsing = true;
              };
            };

          FirefoxHome = {
            TopSites = false;
            SponsoredTopSites = false;
            Highlights = false;
            Pocket = false;
            SponsoredPocket = false;
            Snippets = false;
            Locked = true;
          };

          FirefoxSuggest = {
            WebSuggestions = false;
            SponsoredSuggestions = false;
            ImproveSuggest = false;
            Locked = true;
          };
        };
      };

      profiles.default = {
        search = {
          default = "ddg";
          privateDefault = "ddg";
          force = true;
        };
      };
    };
  };
}
