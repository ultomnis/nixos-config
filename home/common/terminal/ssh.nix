{ config, ... }:

let
  cfg = config.luminosity.home.programs.terminal.ssh;

in
{
  # Secure Shell
  programs.ssh = {
    inherit (cfg) enable;

    matchBlocks = {
      "github" = {
        user = "git";
        hostname = "github.com";
        identitiesOnly = true;
        identityFile = "${config.home.homeDirectory}/.ssh/github";
      };
    };
  };
}
