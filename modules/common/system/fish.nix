{
  config,
  lib,
  pkgs,
  ...
}:

let
  inherit (config.luminosity.system)
    configurations
    selections
    ;

in
{
  config = lib.mkIf (selections.shell == "fish") {
    # The friendly interactive shell
    programs.fish.enable = true;
    users.users.${configurations.primaryUser.name}.shell = pkgs.fish; # Set default shell
  };
}
