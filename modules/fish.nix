{ pkgs, userConfig, ... }:

{
  # Command line shell
  programs.fish.enable = true;
  users.users.${userConfig.username}.shell = pkgs.fish; # Set default shell
}
