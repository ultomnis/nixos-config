{
  config,
  lib,
  pkgs,
  ...
}:

let
  inherit (config.luminosity.home.selections)
    shell
    terminal
    ;

  inherit (config.luminosity.home.desktop.environment)
    fonts
    themes
    ;

in
{
  config = lib.mkIf (terminal == "wezterm") {
    # Terminal emulator
    programs.wezterm = {
      enable = true;

      extraConfig = ''
        local config = {}

        config.color_scheme = '${themes.name}'
        ${if (shell != null) then "config.default_prog = { '${lib.getExe pkgs.${shell}}' }" else ""}
        config.enable_tab_bar = false
        config.font = wezterm.font '${fonts.mono}'
        config.font_size = ${builtins.toString fonts.size}

        return config
      '';
    };
  };
}
