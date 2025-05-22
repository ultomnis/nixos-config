{ config, lib, ... }:

let
  cfg = config.luminosity.home.programs.terminal.fish;

in
{
  config = lib.mkIf cfg.enable {
    # The friendly interactive shell
    programs.fish = {
      enable = true;

      functions = {
        fish_prompt = {
          body = ''
            # Appearance of the command line prompt
            printf '%s%s%s > ' \
              (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
          '';
        };
      };

      interactiveShellInit = ''
        set fish_greeting # Disable greeting
      '';
    };
  };
}
