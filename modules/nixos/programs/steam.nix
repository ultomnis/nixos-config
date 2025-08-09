{ config, ... }:

let
  cfg = config.luminosity.modules.programs.steam;
  inherit (config.luminosity.modules.configurations) unfree;

in
{
  # Steam client
  programs.steam = {
    enable = cfg.enable && unfree.enable;
    localNetworkGameTransfers.openFirewall = true;
    remotePlay.openFirewall = true;
  };
}
