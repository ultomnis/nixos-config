{
  programs.firefox = {
    enable = true;

    # Set firefox policies
    policies = {
      DisableFirefoxAccounts = true;
      DisableFirefoxScreenshots = true;
      DisableFirefoxStudies = true;
      DisableFormHistory = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DisplayBookmarksToolbar = "never";
      NoDefaultBookmarks = true;
      OfferToSaveLogins = false;
      SanitizeOnShutdown = true;
      SearchSuggestEnabled = false;

      # Configure tracking protection
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };

      # Manage extensions
      ExtensionSettings = {
        "*" = {
          installation_mode = "blocked";
        };

        "78272b6fa58f4a1abaac99321d503a20@proton.me" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/proton-pass/latest.xpi";
        };
        
        "addon@darkreader.org" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/darkreader/latest.xpi";
        };
        
        "uBlock0@raymondhill.net" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
        };
      };

      # Customize the home page
      FirefoxHome = {
        TopSites = false;
        SponsoredTopSites = false;
        Highlights = false;
        Pocket = false;
        SponsoredPocket = false;
        Snippets = false;
        Locked = true;
      };

      # Firefox Suggest
      FirefoxSuggest = {
        WebSuggestions = false;
        SponsoredSuggestions = false;
        ImproveSuggest = false;
        Locked = true;
      };

      # Set and lock preferences
      Preferences = {
        "browser.crashReports.unsubmittedCheck.autoSubmit2" = {
          Value = false;
          Status = "locked";
        };
        
        "dom.security.https_only_mode" = {
          Value = true;
          Status = "locked";
        };
      };
    };

    # Attribute set of profiles
    profiles = {
      default = {
        id = 0; # Set default profile

        # Search engine configuration
        search = {
          default = "DuckDuckGo";
          privateDefault = "DuckDuckGo";
          force = true;
        };
      };
    };
  };
}
