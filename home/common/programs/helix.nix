{ pkgs, ... }:

{
  # Modal text editor
  programs.helix = {
    enable = true;
    defaultEditor = true;

    settings = {
      theme = "rose_pine";

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

    languages = {
      language-server = {
        nixd = {
          command = "${pkgs.nixd}/bin/nixd";
        };
      };

      language = [
        {
          name = "nix";
          auto-format = true;
          language-servers = [ "nixd" ];
          formatter = {
            command = "${pkgs.nixfmt-rfc-style}/bin/nixfmt";
          };
        }
      ];
    };
  };
}
