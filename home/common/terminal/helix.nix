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

      extraPackages = with pkgs; [
        nixd
        nixfmt-rfc-style
      ];

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
            language-servers = [ "nixd" ];

            formatter = {
              command = "nixfmt";
            };
          }
        ];
      };
    };
  };
}
