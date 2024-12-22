{ pkgs, userConfig, ... }:

{
  # The friendly interactive shell
  programs.fish.enable = true;
  users.users.${userConfig.username}.shell = pkgs.fish; # Set default shell
}
