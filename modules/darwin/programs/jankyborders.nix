{ config, ... }:

{
  services.jankyborders = {
    enable = true;

    active_color = "0xff${config.lib.stylix.colors.base0D}";
    inactive_color = "0xff${config.lib.stylix.colors.base03}";

    hidpi = true;
    width = 5.0;
  };
}
