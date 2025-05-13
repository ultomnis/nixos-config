{
  config,
  lib,
  osConfig ? null,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.desktop.configurations.nixConfig;

in
{
  config = lib.mkIf cfg.enable {
    nix =
      {
        # Automated garbage collection for user-specific generations
        gc = {
          automatic = true;
          frequency = "weekly";
          options = "--delete-older-than 30d";
        };
      }
      // lib.optionalAttrs (osConfig == null) {
        package = pkgs.nix;

        settings = {
          experimental-features = [
            "nix-command"
            "flakes"
          ];
        };
      };
  };
}
