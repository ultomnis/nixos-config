{
  config,
  lib,
  pkgs,
  ...
}:

{
  programs.firefox = {
    enable = true;

    package = lib.mkIf pkgs.stdenv.isDarwin null;

    # Attribute set of profiles
    profiles = {
      default = {
        id = 0; # Set default profile

        # Firefox add-ons
        extensions = with config.nur.repos.rycee.firefox-addons; [
          darkreader
          duckduckgo-privacy-essentials
          keepassxc-browser
          ublock-origin
        ];

        # Search engine configuration
        search = {
          default = "DuckDuckGo";
          privateDefault = "DuckDuckGo";
          force = true;
        };

        # Firefox preferences
        settings = {
          "app.update.auto" = false; # AppAutoUpdate
          "browser.crashReports.unsubmittedCheck.autoSubmit2" = false; # Allow Firefox to send backlogged crash reports
          "browser.formfill.enable" = false; # DisableFormHistory

          # DisableFirefoxStudies
          "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" = false;
          "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = false;

          # FirefoxHome
          "browser.newtabpage.activity-stream.feeds.section.highlights" = false;
          "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
          "browser.newtabpage.activity-stream.feeds.topsites" = false;
          "browser.newtabpage.activity-stream.showSearch" = true;
          "browser.newtabpage.activity-stream.showSponsored" = false;
          "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;

          # SearchSuggestEnabled
          "browser.search.suggest.enabled" = false;
          "browser.urlbar.suggest.searches" = false;

          "browser.toolbars.bookmarks.visibility" = "never"; # DisplayBookmarksToolbar

          # FirefoxSuggest
          "browser.urlbar.quicksuggest.dataCollection.enabled" = false;
          "browser.urlbar.suggest.quicksuggest.nonsponsored" = false;
          "browser.urlbar.suggest.quicksuggest.sponsored" = false;

          # DisableTelemetry
          "datareporting.healthreport.uploadEnabled" = false;
          "datareporting.policy.dataSubmissionEnabled" = false;
          "toolkit.telemetry.archive.enabled" = false;

          "dom.private-attribution.submission.enabled" = false; # Allow websites to perform privacy-preserving ad measurement
          "dom.security.https_only_mode" = true; # HttpsOnlyMode
          "extensions.pocket.enabled" = false; # DisablePocket
          "extensions.screenshots.disabled" = true; # DisableFirefoxScreenshots
          "extensions.update.enabled" = false; # ExtensionUpdate
          "identity.fxaccounts.enabled" = false; # DisableFirefoxAccounts

          # EnableTrackingProtection
          "privacy.trackingprotection.enabled" = true;
          "privacy.trackingprotection.cryptomining.enabled" = true;
          "privacy.trackingprotection.fingerprinting.enabled" = true;
          "privacy.trackingprotection.pbmode.enabled" = true;

          "signon.rememberSignons" = false; # OfferToSaveLogins
        };
      };
    };
  };
}
