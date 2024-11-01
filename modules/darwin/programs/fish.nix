{ pkgs, userConfig, ... }:

{
  # Command line shell
  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      fish_add_path /opt/homebrew/bin
    '';
  };

  users.users.${userConfig.username}.shell = pkgs.fish;
}
