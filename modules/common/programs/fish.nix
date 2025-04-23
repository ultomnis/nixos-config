{
  config,
  lib,
  pkgs,
  userName,
  ...
}:

let
  inherit (config.luminosity.selections) shell;

in
{
  config = lib.mkIf (shell == "fish") {
    # The friendly interactive shell
    programs.fish.enable = true;
    users.users.${userName}.shell = pkgs.fish; # Set default shell
  };
}
