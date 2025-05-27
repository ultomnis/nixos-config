{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.programs.graphical.zed-editor;

in
{
  config = lib.mkIf cfg.enable {
    # Code editor
    programs.zed-editor = {
      enable = true;

      extensions = [
        "nix"
      ];

      extraPackages = with pkgs; [
        nixd
        nixfmt-rfc-style
      ];

      userSettings = {
        assistant = {
          default_model = {
            provider = "ollama";
            model = "deepseek-r1:latest";
          };

          version = "2";
        };

        cursor_blink = false;
        hour_format = "hour24";

        languages = {
          "Nix" = {
            language_servers = [
              "nixd"
              "!nil"
            ];
          };
        };

        telemetry = {
          diagnostics = false;
          metrics = false;
        };

        terminal = {
          blinking = "off";
        };

        vim_mode = true;
      };
    };
  };
}
