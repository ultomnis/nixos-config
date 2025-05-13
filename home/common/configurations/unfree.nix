{
  config,
  lib,
  osConfig ? null,
  ...
}:

let
  cfg = config.luminosity.home.desktop.configurations.unfree;

in
{
  config = lib.mkIf (cfg.enable && osConfig == null) {
    nixpkgs.config = {
      # Permit unfree packages
      allowUnfreePredicate =
        pkg:
        builtins.elem (lib.getName pkg) [
          "7zz"
        ];
    };
  };
}
