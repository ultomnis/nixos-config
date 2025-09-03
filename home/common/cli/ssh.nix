{ config, ... }:

let
  cfg = config.luminosity.home.cli.ssh;

in
{
  # Secure Shell
  programs.ssh = {
    inherit (cfg) enable;
    enableDefaultConfig = false;

    matchBlocks = {
      "*" = {
        forwardAgent = false;
        addKeysToAgent = "no";
      };

      "github" = {
        user = "git";
        hostname = "github.com";
        identitiesOnly = true;
        identityFile = "${config.home.homeDirectory}/.ssh/github";
      };
    };
  };
}
