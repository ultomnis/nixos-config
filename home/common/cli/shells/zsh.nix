{ config, lib, ... }:

let
  cfg = config.luminosity.home.programs.cli.zsh;

in
{
  # Interactive login shell
  programs.zsh = {
    inherit (cfg) enable;
    autocd = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    history = {
      ignoreAllDups = true;
    };

    initContent = lib.mkOrder 1000 ''
      PS1='%B%F{green}%~%f >%b '
    '';
  };
}
