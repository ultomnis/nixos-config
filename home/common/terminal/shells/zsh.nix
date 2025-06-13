{ config, lib, ... }:

let
  cfg = config.luminosity.home.programs.terminal.zsh;

in
{
  config = lib.mkIf cfg.enable {
    # Interactive login shell
    programs.zsh = {
      enable = true;
      autocd = true;

      autosuggestion = {
        enable = true;
        highlight = "fg=blue";
      };

      syntaxHighlighting = {
        enable = true;

        styles = {
          arg0 = "fg=magenta";
        };
      };

      history = {
        ignoreAllDups = true;
      };

      initContent = lib.mkOrder 1000 ''
        PS1='%B%F{green}%~%f >%b '
      '';
    };
  };
}
