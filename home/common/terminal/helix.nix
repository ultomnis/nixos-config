{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.programs.terminal.helix;

  inherit (config.luminosity.home.desktop.environment) themes;

in
{
  config = lib.mkIf cfg.enable {
    # Modal text editor
    programs.helix = {
      enable = true;
      defaultEditor = true;

      settings = {
        theme = builtins.replaceStrings [ "-" ] [ "_" ] themes.name;

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
