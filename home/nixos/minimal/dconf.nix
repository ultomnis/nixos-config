{ config, lib, ... }:

let
  cfg = config.luminosity.home.desktop.minimal.dconf;

in
{
  config = lib.mkIf cfg.enable {
    # Low-level configuration system
    dconf.settings = {
      # Dark theme
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
    };
  };
}
