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
      defaultEditor = true;

      settings = {
        theme = cfg.theme;

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
          nixd = {
            command = lib.getExe pkgs.nixd;
          };
        };

        language = [
          {
            name = "nix";
            auto-format = true;
            language-servers = [ "nixd" ];
            formatter = {
              command = lib.getExe pkgs.nixfmt-rfc-style;
            };
          }
        ];
      };
    };
  };
}
