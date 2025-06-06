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

      extraPackages = builtins.attrValues {
        inherit (pkgs)
          marksman
          nixd
          nixfmt-rfc-style
          ;

        inherit (pkgs.python313Packages) python-lsp-server;
      };

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
          "JavaScript" = {
            language_servers = [
              "typescript-language-server"
              "!vtsls"
            ];
          };

          "Nix" = {
            formatter = {
              external = {
                command = "nixfmt";
              };
            };

            language_servers = [
              "nixd"
              "!nil"
            ];
          };

          "Python" = {
            language_servers = [
              "pylsp"
              "!pyright"
            ];
          };

          "TSX" = {
            language_servers = [
              "typescript-language-server"
              "!vtsls"
            ];
          };

          "TypeScript" = {
            language_servers = [
              "typescript-language-server"
              "!vtsls"
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
