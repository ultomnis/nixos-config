{ userConfig, ... }:

{
  # Android Debug Bridge
  programs.adb.enable = true;
  users.users.${userConfig.username}.extraGroups = [ "adbusers" ];
}
