{ config, lib, ... }:

let
  cfg = config.luminosity.modules.configurations.security;

in
{
  config = lib.mkIf cfg.enable {
    security.pam.services.sudo_local.touchIdAuth = true;
  };
}
