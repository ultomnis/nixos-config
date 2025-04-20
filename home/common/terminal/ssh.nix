{ config, lib, ... }:

let
  cfg = config.luminosity.programs.terminal.ssh;

in
{
  config = lib.mkIf cfg.enable {
    # Secure Shell
    programs.ssh = {
      enable = true;

      matchBlocks = {
        "github" = {
          user = "git";
          hostname = "github.com";
          identitiesOnly = true;
          identityFile = "${config.home.homeDirectory}/.ssh/github";
        };
      };
    };
  };
}
