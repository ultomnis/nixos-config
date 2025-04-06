{ pkgs, vars, ... }:

{
  # The friendly interactive shell
  programs.fish.enable = true;
  users.users.${vars.userConfig.name}.shell = pkgs.fish; # Set default shell
}
