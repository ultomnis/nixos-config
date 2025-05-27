{
  config,
  lib,
  pkgs,
  systemOS,
  userName,
  ...
}:

let
  cfg = config.luminosity.system.configurations.userConfig;
  inherit (config.luminosity.selections) shell;

in
{
  config = lib.mkIf cfg.enable {
    users =
      {
        users.${userName} =
          {
            home = if (systemOS == "darwin") then "/Users/${userName}" else "/home/${userName}";
            shell = lib.mkIf (shell != null) pkgs.${shell};
            uid = lib.mkIf (cfg.uid != null) cfg.uid;
          }
          // lib.optionalAttrs (systemOS == "linux") {
            isNormalUser = true;
            extraGroups = [ "wheel" ];
          };
      }
      // lib.optionalAttrs (cfg.uid != null && systemOS == "darwin") {
        knownUsers = [
          userName
        ];
      };
  };
}
