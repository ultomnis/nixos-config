{
  config,
  lib,
  userName,
  ...
}:

let
  cfg = config.luminosity.system.programs.adb;

in
{
  config = lib.mkIf cfg.enable {
    # Android Debug Bridge
    programs.adb.enable = true;
    users.users.${userName}.extraGroups = [ "adbusers" ];
  };
}
