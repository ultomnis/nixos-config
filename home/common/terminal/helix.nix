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
        theme = "base16_transparent";

        editor = {
          cursor-shape = {
            normal = "block";
            insert = "bar";
            select = "underline";
          };

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

          qmlls = {
            command = lib.getExe' pkgs.kdePackages.qtdeclarative "qmlls";

            args = [
              "-E"
            ];
          };

          typescript-language-server = {
            command = lib.getExe pkgs.typescript-language-server;

            args = [
              "--stdio"
            ];
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
            name = "qml";

            language-servers = [
              "qmlls"
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
