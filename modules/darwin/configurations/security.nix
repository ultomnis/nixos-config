{ config, lib, ... }:

let
  cfg = config.luminosity.modules.system.configurations.security;

in
{
  config = lib.mkIf cfg.enable {
    security.pam.services.sudo_local.touchIdAuth = true;
  };
}
