{
  # Android Debug Bridge
  programs.adb.enable = true;
  users.users.user.extraGroups = [ "adbusers" ];
}
