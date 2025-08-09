{ config, lib, ... }:

let
  cfg = config.luminosity.modules.system.configurations.security;

in
{
  config = lib.mkIf cfg.enable {
    security = {
      sudo.extraConfig = ''
        Defaults passprompt="What? Make it yourself:"
      '';
    };
  };
}
