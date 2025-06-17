{ config, ... }:

let
  cfg = config.luminosity.system.programs.zsh;

in
{
  # Interactive login shell
  programs.zsh = {
    inherit (cfg) enable;
  };
}
