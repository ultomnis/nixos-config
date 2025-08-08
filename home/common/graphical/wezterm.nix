{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.programs.graphical.wezterm;

in
{
  # Terminal emulator
  programs.wezterm = {
    inherit (cfg) enable;

    extraConfig = ''
      local config = wezterm.config_builder()

      ${lib.optionalString (
        cfg.shell != null
      ) "config.default_prog = { '${lib.getExe pkgs.${cfg.shell}}' }"}

      config.enable_tab_bar = false
      config.front_end = 'WebGpu'
      config.max_fps = ${toString cfg.maxFPS}
      config.webgpu_power_preference = 'HighPerformance'

      config.window_padding = {
        left = 5,
        right = 5,
        top = 5,
        bottom = 5,
      }

      return config
    '';
  };
}
