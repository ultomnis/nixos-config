{ config, lib, ... }:

let
  cfg = config.luminosity.home.programs.terminal.zsh;

in
{
  config = lib.mkIf cfg.enable {
    # Interactive login shell
    programs.zsh = {
      enable = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      history = {
        ignoreAllDups = true;
      };

      initContent = lib.mkOrder 1000 ''
        PS1='%~ > '
      '';
    };
  };
}
