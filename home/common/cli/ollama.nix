{ config, ... }:

let
  cfg = config.luminosity.home.programs.cli.ollama;

in
{
  # Run large language models locally
  services.ollama = {
    inherit (cfg) enable;
    environmentVariables = cfg.environmentVariables;
  };
}
