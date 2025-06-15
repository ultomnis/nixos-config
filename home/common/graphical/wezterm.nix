{
  config,
  lib,
  osConfig ? null,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.programs.graphical.wezterm;
  nixConfig = if (osConfig != null) then osConfig else config;

in
{
  config = lib.mkIf cfg.enable {
    # Terminal emulator
    programs.wezterm = {
      enable = true;

      extraConfig = ''
        local config = wezterm.config_builder()

        ${if (cfg.theme != null) then "config.color_scheme = '${cfg.theme}'" else ""}

        config.colors = {
          foreground = '#ffffff',
          background = '#000000',
        }

        ${
          if (nixConfig.luminosity.selections.shell != null) then
            "config.default_prog = { '${lib.getExe pkgs.${nixConfig.luminosity.selections.shell}}' }"
          else
            ""
        }

        config.enable_tab_bar = false
        ${if (cfg.font.name != null) then "config.font = wezterm.font '${cfg.font.name}'" else ""}
        ${if (cfg.font.size != null) then "config.font_size = ${toString cfg.font.size}" else ""}
        config.front_end = 'WebGpu'
        config.macos_window_background_blur = 60
        config.max_fps = ${toString cfg.maxFPS}
        config.webgpu_power_preference = 'HighPerformance'
        config.window_background_opacity = 0.2

        return config
      '';
    };
  };
}
