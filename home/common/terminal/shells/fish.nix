{ config, ... }:

let
  cfg = config.luminosity.home.programs.terminal.fish;

in
{
  # The friendly interactive shell
  programs.fish = {
    inherit (cfg) enable;

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
      set fish_color_autosuggestion magenta
      set fish_color_command cyan
      set fish_color_param normal
    '';
  };
}
