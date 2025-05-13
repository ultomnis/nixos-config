{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.programs.graphical.wezterm;
  inherit (config.luminosity.home.desktop.environment) fonts;
  inherit (config.luminosity.home.selections) shell;

in
{
  config = lib.mkIf cfg.enable {
    # Terminal emulator
    programs.wezterm = {
      enable = true;

      extraConfig = ''
        local config = {}

        config.color_scheme = '${cfg.theme}'
        ${if (shell != null) then "config.default_prog = { '${lib.getExe pkgs.${shell}}' }" else ""}
        config.enable_tab_bar = false
        config.font = wezterm.font '${fonts.mono}'
        config.font_size = ${toString fonts.size}

        return config
      '';
    };
  };
}
