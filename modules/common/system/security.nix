{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.system.configurations.security;
  inherit (pkgs.stdenv) isDarwin;

in
{
  config = lib.mkIf cfg.enable {
    security = {
      sudo.extraConfig = ''
        Defaults passprompt="What? Make it yourself:"
      '';

      pam = lib.optionalAttrs isDarwin {
        services.sudo_local.touchIdAuth = true;
      };
    };
  };
}
