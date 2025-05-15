{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.programs.graphical.wezterm;
  inherit (config.luminosity.home.selections) shell;

in
{
  config = lib.mkIf cfg.enable {
    # Terminal emulator
    programs.wezterm = {
      enable = true;

      extraConfig = ''
        local config = {}

        ${if (cfg.theme != null) then "config.color_scheme = '${cfg.theme}'" else ""}
        ${if (shell != null) then "config.default_prog = { '${lib.getExe pkgs.${shell}}' }" else ""}
        config.enable_tab_bar = false
        ${if (cfg.font != null) then "config.font = wezterm.font '${cfg.font}'" else ""}
        ${if (cfg.fontSize != null) then "config.font_size = ${toString cfg.fontSize}" else ""}
        config.front_end = 'WebGpu'
        config.max_fps = ${toString cfg.maxFPS}
        config.webgpu_power_preference = 'HighPerformance'

        return config
      '';
    };
  };
}
