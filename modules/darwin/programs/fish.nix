{ pkgs, userConfig, ... }:

{
  # The friendly interactive shell
  programs.fish.enable = true;
  users.users.${userConfig.name}.shell = pkgs.fish; # Set default shell
}
