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
      "java"
      "latex"
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

      theme = lib.mkIf (cfg.theme != null) cfg.theme;
      title_bar.show_sign_in = false;

      "experimental.theme_overrides" = {
        "background" = "#000000cc";
        "background.appearance" = "transparent";
        "editor.background" = "#00000000";
        "editor.gutter.background" = "#00000000";
        "elevated_surface.background" = "#000000cc";
        "ghost_element.background" = "#00000000";
        "panel.background" = "#00000000";
        "status_bar.background" = "#000000cc";
        "tab_bar.background" = "#00000000";
        "tab.active_background" = "#00000000";
        "tab.inactive_background" = "#00000000";
        "terminal.background" = "#00000000";
        "title_bar.background" = "#000000cc";
        "toolbar.background" = "#00000000";
      };
    };
  };
}
