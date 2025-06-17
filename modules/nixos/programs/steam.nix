{ config, ... }:

let
  cfg = config.luminosity.system.programs.steam;
  inherit (config.luminosity.system.configurations) unfree;

in
{
  # Steam client
  programs.steam = {
    enable = cfg.enable && unfree.enable;
    localNetworkGameTransfers.openFirewall = true;
    remotePlay.openFirewall = true;
  };
}
