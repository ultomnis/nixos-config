{ lib, pkgs, ... }:

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
          command = "${lib.getExe pkgs.nixd}";
        };
      };

      language = [
        {
          name = "nix";
          auto-format = true;
          language-servers = [ "nixd" ];
          formatter = {
            command = "${lib.getExe pkgs.nixfmt-rfc-style}";
          };
        }
      ];
    };
  };
}
