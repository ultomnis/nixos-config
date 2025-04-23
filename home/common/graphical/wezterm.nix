{
  config,
  lib,
  osConfig,
  ...
}:

let
  inherit (osConfig.luminosity.selections) terminal;

  inherit (config.luminosity.desktop)
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
        config.enable_tab_bar = false
        config.font = wezterm.font '${fonts.mono}'
        config.font_size = ${builtins.toString fonts.size}

        return config
      '';
    };
  };
}
