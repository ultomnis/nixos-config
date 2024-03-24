{ lib, pkgs, ... }:

lib.mkMerge [
  {
    # Permit unfree steam packages
    nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
      "steam"
      "steam-original"
      "steam-run"
    ];
  }

  (lib.mkIf (!pkgs.stdenv.isAarch64) {
    # Steam client
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true; # Steam remote play
      dedicatedServer.openFirewall = true; # Source dedicated server
    };
  })
]
