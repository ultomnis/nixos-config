{ config, ... }:

let
  cfg = config.luminosity.home.programs.terminal.bash;

in
{
  # Bourne Again SHell
  programs.bash = {
    inherit (cfg) enable;

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
}
