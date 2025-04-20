{ config, lib, ... }:

let
  inherit (config.luminosity.system.configurations) primaryUser;
  cfg = config.luminosity.system.programs.adb;

in
{
  config = lib.mkIf cfg.enable {
    # Android Debug Bridge
    programs.adb.enable = true;
    users.users.${primaryUser.name}.extraGroups = [ "adbusers" ];
  };
}
