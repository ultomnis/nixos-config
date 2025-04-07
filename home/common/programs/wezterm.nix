{
  lib,
  pkgs,
  vars,
  ...
}:

{
  programs.wezterm = {
    enable = true;

    extraConfig = ''
      local config = {}

      config.color_scheme = 'rose-pine'
      config.default_prog = { '${lib.getExe pkgs.fish}' }
      config.enable_tab_bar = false
      config.font = wezterm.font 'Hack Nerd Font Mono'
      config.font_size = ${toString vars.fontSize}

      return config
    '';
  };
}
