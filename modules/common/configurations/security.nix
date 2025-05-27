{
  config,
  lib,
  systemOS,
  ...
}:

let
  cfg = config.luminosity.system.configurations.security;

in
{
  config = lib.mkIf cfg.enable {
    security = {
      sudo.extraConfig = ''
        Defaults passprompt="What? Make it yourself:"
      '';

      pam.services =
        lib.optionalAttrs (systemOS == "linux") {
          login.enableGnomeKeyring = true;
        }
        // lib.optionalAttrs (systemOS == "darwin") {
          sudo_local.touchIdAuth = true;
        };
    };
  };
}
