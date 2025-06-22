{ config, ... }:

let
  cfg = config.luminosity.home.desktop.environment.ssh-agent;

in
{
  # OpenSSH private key agent
  services.ssh-agent = {
    inherit (cfg) enable;
  };
}
