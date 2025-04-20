{ config, lib, ... }:

let
  inherit (config.luminosity.programs.terminal) ollama;

in
{
  config = lib.mkIf ollama.enable {
    # Run large language models locally
    services.ollama = {
      enable = true;
      environmentVariables = ollama.environmentVariables;
    };
  };
}
