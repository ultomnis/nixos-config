{
  config,
  lib,
  pkgs,
  ...
}:

let
  inherit (config.luminosity.system.configurations) primaryUser;

  inherit (pkgs.stdenv)
    isDarwin
    isLinux
    ;

in
{
  config = lib.mkIf primaryUser.enable {
    users =
      {
        users.${primaryUser.name} =
          {
            home = if isDarwin then "/Users/${primaryUser.name}" else "/home/${primaryUser.name}";
            uid = primaryUser.uid;
          }
          // lib.optionalAttrs isLinux {
            isNormalUser = true;
            extraGroups = [ "wheel" ];
          };
      }
      // lib.optionalAttrs isDarwin {
        knownUsers = [
          "${primaryUser.name}"
        ];
      };
  };
}
