{ config, lib, ... }:

let
  cfg = config.luminosity.system.programs.steam;
  inherit (config.luminosity.system.configurations) unfree;

in
{
  config = lib.mkIf (cfg.enable && unfree.enable) {
    # Steam client
    programs.steam = {
      enable = true;
      localNetworkGameTransfers.openFirewall = true;
      remotePlay.openFirewall = true;
    };
  };
}
