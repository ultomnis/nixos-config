{ config, lib, ... }:

let
  cfg = config.luminosity.system.programs.zsh;

in
{
  config = lib.mkIf cfg.enable {
    # Interactive login shell
    programs.zsh.enable = true;
  };
}
