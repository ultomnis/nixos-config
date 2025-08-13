{ config, pkgs, ... }:

let
  cfg = config.luminosity.modules.services.mullvad-vpn;

in
{
  # Mullvad VPN
  services.mullvad-vpn = {
    inherit (cfg) enable;
    package = pkgs.mullvad-vpn;
  };
}
