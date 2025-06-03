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
            name = "nix";

            formatter = {
              command = "nixfmt";
            };
          }
        ];
      };
    };
  };
}
