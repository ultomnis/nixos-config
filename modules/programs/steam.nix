{ lib, pkgs, ... }:

lib.mkIf (!pkgs.stdenv.isAarch64) {
  # Steam client
  programs.steam.enable = true;
}
