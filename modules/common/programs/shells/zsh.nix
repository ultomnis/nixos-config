{ config, ... }:

let
  cfg = config.luminosity.modules.system.programs.zsh;

in
{
  # Interactive login shell
  programs.zsh = {
    inherit (cfg) enable;
  };
}
