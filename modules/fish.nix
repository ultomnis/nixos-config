{ pkgs, ... }:

{
  # Command line shell
  programs.fish.enable = true;
  users.users.user.shell = pkgs.fish; # Set default shell
}
