{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.system.configurations.security;
  inherit (pkgs.stdenv) isDarwin isLinux;

in
{
  config = lib.mkIf cfg.enable {
    security = {
      sudo.extraConfig = ''
        Defaults passprompt="What? Make it yourself:"
      '';

      pam.services =
        lib.optionalAttrs isLinux {
          login.enableGnomeKeyring = true;
        }
        // lib.optionalAttrs isDarwin {
          sudo_local.touchIdAuth = true;
        };
    };
  };
}
