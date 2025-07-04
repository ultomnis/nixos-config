{ config, lib, ... }:

let
  cfg = config.luminosity.home.programs.terminal.zsh;

in
{
  # Interactive login shell
  programs.zsh = {
    inherit (cfg) enable;
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
}
