{
  config,
  lib,
  osConfig ? null,
  ...
}:

let
  cfg = config.luminosity.home.configurations.nixConfig;

in
{
  config = lib.mkIf cfg.enable {
    nix = {
      # Automated garbage collection for user-specific generations
      gc = {
        automatic = true;
        frequency = "weekly";
        options = "--delete-older-than 30d";
      };

      settings = lib.optionalAttrs (osConfig == null) {
        experimental-features = [
          "nix-command"
          "flakes"
        ];
      };
    };
  };
}
