{ pkgs, ... }:

{
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
          {
            "*" = {
              installation_mode = "blocked";
            };
          }
          // builtins.mapAttrs
            (_: extension: {
              installation_mode = "force_installed";
              install_url = "https://addons.mozilla.org/firefox/downloads/latest/${extension}/latest.xpi";
            })
            {
              "{446900e4-71c2-419f-a6a7-df9c091e268b}" = "bitwarden-password-manager";
              "addon@darkreader.org" = "darkreader";
              "uBlock0@raymondhill.net" = "ublock-origin";
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
}
