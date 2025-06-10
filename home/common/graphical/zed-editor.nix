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
        "qml"
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

        lsp = {
          marksman = {
            binary = {
              path = lib.getExe pkgs.marksman;
            };
          };

          nixd = {
            binary = {
              path = lib.getExe pkgs.nixd;
            };
          };

          pylsp = {
            binary = {
              path = lib.getExe pkgs.python313Packages.python-lsp-server;
            };
          };

          qmljs = {
            binary = {
              path = lib.getExe' pkgs.kdePackages.qtdeclarative "qmlls";

              arguments = [
                "-E"
              ];
            };
          };

          typescript-language-server = {
            binary = {
              path = lib.getExe pkgs.typescript-language-server;

              arguments = [
                "--stdio"
              ];
            };
          };
        };

        languages = {
          "JavaScript" = {
            language_servers = [
              "typescript-language-server"
            ];
          };

          "Markdown" = {
            language_servers = [
              "marksman"
            ];
          };

          "Nix" = {
            formatter = {
              external = {
                command = lib.getExe pkgs.nixfmt-rfc-style;
              };
            };

            language_servers = [
              "nixd"
            ];
          };

          "Python" = {
            language_servers = [
              "pylsp"
            ];
          };

          "QML" = {
            language_servers = [
              "qmljs"
            ];
          };

          "TSX" = {
            language_servers = [
              "typescript-language-server"
            ];
          };

          "TypeScript" = {
            language_servers = [
              "typescript-language-server"
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
