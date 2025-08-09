{
  config,
  lib,
  osConfig ? null,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.universal.nixConfig;

in
{
  config = lib.mkIf cfg.enable {
    nix = lib.mkMerge [
      {
        # Automated garbage collection for user-specific generations
        gc = {
          automatic = true;
          frequency = "weekly";
          options = "--delete-older-than 30d";
        };
      }

      (lib.mkIf (osConfig == null) {
        package = pkgs.nix;

        settings = {
          experimental-features = [
            "flakes"
            "nix-command"
            "pipe-operators"
          ];
        };
      })
    ];
  };
}
