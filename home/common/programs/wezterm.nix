{ vars, ... }:

{
  programs.wezterm = {
    enable = true;

    extraConfig = ''
      local config = {}

      config.color_scheme = 'rose-pine'
      config.enable_tab_bar = false
      config.font = wezterm.font 'Hack Nerd Font Mono'
      config.font_size = ${builtins.toString vars.fontSize}

      return config
    '';
  };
}
