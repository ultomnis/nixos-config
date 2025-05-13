{
  config,
  lib,
  pkgs,
  userName,
  ...
}:

let
  cfg = config.luminosity.system.configurations.userConfig;
  inherit (config.luminosity.selections) shell;

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
            shell = if (shell != null) then pkgs.${shell} else null;
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
