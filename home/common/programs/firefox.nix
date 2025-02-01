{ pkgs, ... }:

{
  programs.firefox = {
    enable = true;

    package = if pkgs.stdenv.isDarwin then pkgs.firefox-unwrapped else pkgs.firefox;

    profiles = {
      default = {
        # Firefox add-ons
        extensions = with pkgs.nur.repos.rycee.firefox-addons; [
          bitwarden
          darkreader
          duckduckgo-privacy-essentials
          ublock-origin
        ];

        preConfig = builtins.readFile "${pkgs.arkenfox-userjs}/user.js";

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
