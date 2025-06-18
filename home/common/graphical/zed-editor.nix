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
  # Code editor
  programs.zed-editor = {
    inherit (cfg) enable;

    extensions = [
      "nix"
      "qml"
      "rose-pine-theme"
    ];

    userSettings =
      {
        agent = {
          default_model = {
            provider = "ollama";
            model = "deepseek-r1:latest";
          };

          version = "2";
        };

        collaboration_panel.button = false;
        cursor_blink = false;

        features = {
          edit_prediction_provider = "none";
        };

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

        notification_panel.button = false;
        tab_bar.show_nav_history_buttons = false;

        telemetry = {
          diagnostics = false;
          metrics = false;
        };

        terminal = {
          blinking = "off";
          toolbar.breadcrumbs = false;
        };

        title_bar.show_sign_in = false;
        vim_mode = true;

        "experimental.theme_overrides" = {
          "background" = "#00000099";
          "background.appearance" = "blurred";
          "border" = "#ffffff99";
          "border.variant" = "#ffffff00";
          "editor.active_line.background" = "#ffffff00";
          "editor.background" = "#ffffff00";
          "editor.gutter.background" = "#ffffff00";
          "elevated_surface.background" = "#00000099";
          "ghost_element.background" = "#ffffff00";
          "panel.background" = "#ffffff00";
          "scrollbar.track.border" = "#ffffff00";
          "status_bar.background" = "#00000099";
          "tab_bar.background" = "#ffffff00";
          "tab.active_background" = "#ffffff00";
          "tab.inactive_background" = "#ffffff00";
          "terminal.background" = "#ffffff00";
          "title_bar.background" = "#00000099";
          "toolbar.background" = "#ffffff00";
        };
      }
      |> lib.recursiveUpdate (
        lib.optionalAttrs (cfg.font.name != null) {
          buffer_font_family = cfg.font.name;
        }
      )
      |> lib.recursiveUpdate (
        lib.optionalAttrs (cfg.font.size != null) {
          buffer_font_size = cfg.font.size;
        }
      )
      |> lib.recursiveUpdate (
        lib.optionalAttrs (cfg.theme != null) {
          theme = cfg.theme;
        }
      );
  };
}
