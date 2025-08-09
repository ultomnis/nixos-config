{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.programs.gui.zed-editor;

in
{
  # Code editor
  programs.zed-editor = {
    inherit (cfg) enable;

    extensions = [
      "java"
      "latex"
      "nix"
      "qml"
    ];

    userSettings = {
      agent = {
        default_model = {
          provider = "ollama";
          model = "deepseek-r1:latest";
        };

        version = "2";
      };

      buffer_line_height = "standard";
      collaboration_panel.button = false;
      cursor_blink = false;

      features = {
        edit_prediction_provider = "none";
      };

      helix_mode = true;
      hour_format = "hour24";

      lsp = {
        clangd.binary.path = lib.getExe' pkgs.clang-tools "clangd";
        jdtls.binary.path = lib.getExe pkgs.jdt-language-server;
        marksman.binary.path = lib.getExe pkgs.marksman;
        nixd.binary.path = lib.getExe pkgs.nixd;
        pylsp.binary.path = lib.getExe pkgs.python313Packages.python-lsp-server;

        qmljs = {
          binary = {
            path = lib.getExe' pkgs.kdePackages.qtdeclarative "qmlls";

            arguments = [
              "-E"
            ];
          };
        };

        rust-analyzer.binary.path = lib.getExe pkgs.rust-analyzer;
        texlab.binary.path = lib.getExe pkgs.texlab;

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
          formatter.external.command = lib.getExe pkgs.nixfmt-rfc-style;

          language_servers = [
            "nixd"
          ];
        };

        "Python" = {
          language_servers = [
            "pylsp"
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

      toolbar = {
        breadcrumbs = false;
        quick_actions = false;
      };
    };
  };
}
