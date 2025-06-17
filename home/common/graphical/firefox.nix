{ config, lib, ... }:

let
  cfg = config.luminosity.home.programs.graphical.firefox;

in
{
  # Web browser
  programs.firefox = {
    inherit (cfg) enable;

    # Set Firefox policies
    policies = {
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
            |> lib.recursiveUpdate extraOptions;
        in
        {
          "*" = {
            installation_mode = "blocked";
          };

          "addon@darkreader.org" = extensionSetting "darkreader" { };
          "keepassxc-browser@keepassxc.org" = extensionSetting "keepassxc-browser" { };

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

    profiles =
      cfg.profiles
      |> map (profile: {
        inherit (profile) name;

        value = {
          extensions.force = true;
          inherit (profile) id;

          search = {
            default = "ddg";
            privateDefault = "ddg";
            force = true;
          };
        };
      })
      |> lib.listToAttrs;
  };
}
