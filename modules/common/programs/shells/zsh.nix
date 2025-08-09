{ config, ... }:

let
  cfg = config.luminosity.modules.programs.zsh;

in
{
  # Interactive login shell
  programs.zsh = {
    inherit (cfg) enable;
  };
}
