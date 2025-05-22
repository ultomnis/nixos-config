{ config, lib, ... }:

let
  cfg = config.luminosity.home.programs.terminal.starship;

in
{
  config = lib.mkIf cfg.enable {
    # Cross-shell prompt
    programs.starship = {
      enable = true;

      settings = {
        add_newline = false;

        battery = {
          display = [
            {
              threshold = 10;
              style = "bold red";
            }
            {
              threshold = 20;
              style = "bold yellow";
            }
            {
              threshold = 100;
              style = "bold green";
            }
          ];
        };

        format = "$time$battery$all$directory$character";

        nix_shell.heuristic = true;

        time = {
          disabled = false;
          format = "[$time]($style) ";
        };
      };
    };
  };
}
