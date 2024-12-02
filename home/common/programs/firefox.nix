{ pkgs, ... }:

{
  programs.firefox = {
    enable = true;

    package = if pkgs.stdenv.isDarwin then pkgs.firefox-beta-unwrapped else pkgs.firefox-beta;

    profiles = {
      default = {
        # Firefox add-ons
        extensions = with pkgs.nur.repos.rycee.firefox-addons; [
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

          # DisableTelemetry
          "datareporting.healthreport.uploadEnabled" = false;
          "datareporting.policy.dataSubmissionEnabled" = false;
          "toolkit.telemetry.archive.enabled" = false;

          "dom.security.https_only_mode" = true; # HttpsOnlyMode

          # EnableTrackingProtection
          "privacy.trackingprotection.enabled" = true;
          "privacy.trackingprotection.cryptomining.enabled" = true;
          "privacy.trackingprotection.fingerprinting.enabled" = true;
          "privacy.trackingprotection.pbmode.enabled" = true;
        };
      };
    };
  };
}
