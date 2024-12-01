{ pkgs, ... }:

{
  # Modal text editor
  programs.helix = {
    enable = true;
    defaultEditor = true;

    extraPackages = with pkgs; [
      nixd
      nixfmt-rfc-style
    ];

    # Helix configuration
    settings = {
      theme = "default_transparent";

      editor = {
        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };

        cursorline = true;
        indent-guides.render = true;
        line-number = "relative";
        lsp.display-messages = true;
      };
    };

    # Language-specific settings
    languages = {
      language-server = {
        nixd = {
          command = "nixd";
        };
      };

      language = [
        {
          name = "nix";
          auto-format = true;
          language-servers = [ "nixd" ];
          formatter = {
            command = "nixfmt";
          };
        }
      ];
    };

    # Helix theme
    themes = {
      default_transparent = {
        "inherits" = "default";
        "ui.background" = { };
      };
    };
  };
}
