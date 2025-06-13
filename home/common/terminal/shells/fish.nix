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
              (set_color --bold $fish_color_cwd) (prompt_pwd) (set_color --bold normal)
          '';
        };
      };

      interactiveShellInit = ''
        set fish_greeting # Disable greeting
        set fish_color_command magenta
        set fish_color_param white
        set fish_color_autosuggestion blue
      '';
    };
  };
}
