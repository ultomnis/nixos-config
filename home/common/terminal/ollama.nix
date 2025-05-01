{ config, lib, ... }:

let
  cfg = config.luminosity.home.programs.terminal.ollama;

in
{
  config = lib.mkIf cfg.enable {
    # Run large language models locally
    services.ollama = {
      enable = true;
      environmentVariables = cfg.environmentVariables;
    };
  };
}
