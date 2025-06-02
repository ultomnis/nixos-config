{ config, lib, ... }:

let
  cfg = config.luminosity.home.desktop.minimal.ssh-agent;

in
{
  config = lib.mkIf cfg.enable {
    # OpenSSH private key agent
    services.ssh-agent.enable = true;
  };
}
