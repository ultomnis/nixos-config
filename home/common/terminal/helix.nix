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

      extraPackages = builtins.attrValues {
        inherit (pkgs)
          marksman
          nixd
          nixfmt-rfc-style
          typescript-language-server
          ;

        inherit (pkgs.python313Packages) python-lsp-server;
      };

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
              command = "nixfmt";
            };
          }
          {
            name = "python";

            language-servers = [
              "pylsp"
            ];
          }
        ];
      };
    };
  };
}
