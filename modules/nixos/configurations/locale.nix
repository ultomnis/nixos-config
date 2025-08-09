{ config, lib, ... }:

let
  cfg = config.luminosity.modules.configurations.locale;

in
{
  config = lib.mkIf cfg.enable {
    # Set your time zone
    time.timeZone = "America/New_York";

    # Select internationalisation properties
    i18n.defaultLocale = "en_US.UTF-8";
  };
}
