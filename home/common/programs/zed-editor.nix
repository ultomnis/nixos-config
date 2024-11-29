{ pkgs, ... }:

{
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
      cursor_blink = false;
      hour_format = "hour24";
      vim_mode = true;

      assistant = {
        default_model = {
          provider = "ollama";
          model = "qwen2.5-coder:latest";
        };

        version = "2";
      };

      "experimental.theme_overrides" = {
        "background.appearance" = "transparent";
        "background" = "#000000cc";
        "editor.background" = "#ffffff00";
        "editor.gutter.background" = "#ffffff00";
        "panel.background" = "#ffffff00";
        "status_bar.background" = "#ffffff00";
        "tab_bar.background" = "#ffffff00";
        "tab.active_background" = "#ffffff1a";
        "tab.inactive_background" = "#ffffff00";
        "terminal.background" = "#ffffff00";
        "title_bar.background" = "#000000cc";
        "toolbar.background" = "#ffffff00";
      };

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
    };
  };
}
