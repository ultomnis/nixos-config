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
        "rose-pine-theme"
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

        buffer_font_family = cfg.font;
        buffer_font_size = cfg.fontSize;
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

        theme = cfg.theme;
        vim_mode = true;
      };
    };
  };
}
