{
  lib,
  osConfig ? null,
  ...
}:

let
  inherit (lib)
    mkOption
    types
    ;

  nixConfig =
    if (osConfig != null) then osConfig.luminosity.system.configurations.nixConfig.enable else false;
  unfree =
    if (osConfig != null) then osConfig.luminosity.system.configurations.unfree.enable else false;

in
{
  options.luminosity.home.configurations = {
    nixConfig.enable = mkOption {
      type = types.bool;
      default = nixConfig;
      description = "Whether to enable user-specific Nix settings";
    };

    unfree.enable = mkOption {
      type = types.bool;
      default = unfree;
      description = "Whether to enable unfree software";
    };
  };
}
