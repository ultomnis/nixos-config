{
  config,
  lib,
  pkgs,
  userName,
  ...
}:

let
  cfg = config.luminosity.system.configurations.userConfig;

  inherit (pkgs.stdenv)
    isDarwin
    isLinux
    ;

in
{
  config = lib.mkIf cfg.enable {
    users =
      {
        users.${userName} =
          {
            home = if isDarwin then "/Users/${userName}" else "/home/${userName}";
            uid = cfg.uid;
          }
          // lib.optionalAttrs isLinux {
            isNormalUser = true;
            extraGroups = [ "wheel" ];
          };
      }
      // lib.optionalAttrs isDarwin {
        knownUsers = [
          userName
        ];
      };
  };
}
