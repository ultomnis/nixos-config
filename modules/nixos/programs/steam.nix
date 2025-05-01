{ config, lib, ... }:

let
  cfg = config.luminosity.system.programs.steam;
  unfree = config.luminosity.system.configurations.unfree;

in
{
  config = lib.mkIf (cfg.enable && unfree.enable) {
    # Steam client
    programs.steam = {
      enable = true;
      localNetworkGameTransfers.openFirewall = true;
      remotePlay.openFirewall = true;
    };

    nixpkgs.config = {
      # Permit unfree packages
      allowUnfreePredicate =
        pkg:
        builtins.elem (lib.getName pkg) [
          "steam"
          "steam-unwrapped"
        ];
    };
  };
}
