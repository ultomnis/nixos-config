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
        "rose-pine-theme"
      ];

      userSettings = {
        agent = {
          default_model = {
            provider = "ollama";
            model = "deepseek-r1:latest";
          };

          version = "2";
        };

        buffer_font_family = lib.mkIf (cfg.font.name != null) cfg.font.name;
        buffer_font_size = lib.mkIf (cfg.font.size != null) cfg.font.size;
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

        theme = lib.mkIf (cfg.theme != null) cfg.theme;
        vim_mode = true;

        "experimental.theme_overrides" = {
          "background" = "#00000099";
          "background.appearance" = "blurred";
          "editor.active_line.background" = "#ffffff00";
          "editor.background" = "#ffffff00";
          "editor.gutter.background" = "#ffffff00";
          "elevated_surface.background" = "#00000099";
          "panel.background" = "#00000099";
          "status_bar.background" = "#00000099";
          "tab_bar.background" = "#ffffff00";
          "tab.active_background" = "#00000099";
          "tab.inactive_background" = "#ffffff00";
          "terminal.background" = "#ffffff00";
          "title_bar.background" = "#00000099";
          "toolbar.background" = "#ffffff00";
        };
      };
    };
  };
}
