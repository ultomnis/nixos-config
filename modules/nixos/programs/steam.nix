{ config, ... }:

let
  cfg = config.luminosity.modules.system.programs.steam;
  inherit (config.luminosity.modules.system.configurations) unfree;

in
{
  # Steam client
  programs.steam = {
    enable = cfg.enable && unfree.enable;
    localNetworkGameTransfers.openFirewall = true;
    remotePlay.openFirewall = true;
  };
}
