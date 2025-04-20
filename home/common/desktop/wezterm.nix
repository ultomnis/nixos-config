{ config, lib, ... }:

let
  inherit (config.luminosity.desktop)
    fonts
    selections
    themes
    ;

in
{
  config = lib.mkIf (selections.terminal == "wezterm") {
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
