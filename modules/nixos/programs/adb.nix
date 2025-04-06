{ vars, ... }:

{
  # Android Debug Bridge
  programs.adb.enable = true;
  users.users.${vars.userConfig.name}.extraGroups = [ "adbusers" ];
}
