{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.programs.terminal.helix;

in
{
  config = lib.mkIf cfg.enable {
    # Modal text editor
    programs.helix = {
      enable = true;

      settings = {
        editor = {
          cursor-shape = {
            normal = "block";
            insert = "bar";
            select = "underline";
          };

          cursorline = true;
          indent-guides.render = true;
          line-number = "relative";
        };
      };

      languages = {
        language-server = {
          marksman = {
            command = lib.getExe pkgs.marksman;
          };

          nixd = {
            command = lib.getExe pkgs.nixd;
          };

          pylsp = {
            command = lib.getExe pkgs.python313Packages.python-lsp-server;
          };

          typescript-language-server = {
            command = lib.getExe pkgs.typescript-language-server;
          };
        };

        language = [
          {
            name = "markdown";

            language-servers = [
              "marksman"
            ];
          }
          {
            name = "nix";

            language-servers = [
              "nixd"
            ];

            formatter = {
              command = lib.getExe pkgs.nixfmt-rfc-style;
            };
          }
          {
            name = "python";

            language-servers = [
              "pylsp"
            ];
          }
          {
            name = "typescript";

            language-servers = [
              "typescript-language-server"
            ];
          }
        ];
      };
    };
  };
}
