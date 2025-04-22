{
  config,
  lib,
  pkgs,
  userName,
  ...
}:

let
  inherit (config.luminosity.system) selections;

in
{
  config = lib.mkIf (selections.shell == "fish") {
    # The friendly interactive shell
    programs.fish.enable = true;
    users.users.${userName}.shell = pkgs.fish; # Set default shell
  };
}
