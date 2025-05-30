{
  config,
  lib,
  osConfig ? null,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.programs.graphical.wezterm;
  shell =
    if (osConfig != null) then
      osConfig.luminosity.selections.shell
    else
      config.luminosity.selections.shell;

in
{
  config = lib.mkIf cfg.enable {
    # Terminal emulator
    programs.wezterm = {
      enable = true;

      extraConfig = ''
        local config = wezterm.config_builder()

        ${if (shell != null) then "config.default_prog = { '${lib.getExe pkgs.${shell}}' }" else ""}
        config.enable_tab_bar = false
        config.front_end = 'WebGpu'
        config.max_fps = ${toString cfg.maxFPS}
        config.webgpu_power_preference = 'HighPerformance'

        return config
      '';
    };
  };
}
