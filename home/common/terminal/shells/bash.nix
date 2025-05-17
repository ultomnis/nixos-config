{ config, lib, ... }:

let
  cfg = config.luminosity.home.programs.terminal.bash;

in
{
  config = lib.mkIf cfg.enable {
    # Bourne Again SHell
    programs.bash = {
      enable = true;

      bashrcExtra = ''
        PS1='\w > '
      '';

      historyControl = [
        "erasedups"
        "ignoreboth"
      ];

      shellOptions = [
        "autocd"
        "cdspell"
        "checkjobs"
        "checkwinsize"
        "dirspell"
        "extglob"
        "globstar"
        "histappend"
      ];
    };
  };
}
