{
  config,
  lib,
  pkgs,
  userName,
  ...
}:

let
  cfg = config.luminosity.system.programs.fish;

in
{
  config = lib.mkIf cfg.enable {
    # The friendly interactive shell
    programs.fish.enable = true;
    users.users.${userName}.shell = pkgs.fish; # Set default shell
  };
}
