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
