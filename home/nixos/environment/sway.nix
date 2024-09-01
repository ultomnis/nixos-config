{ config, lib, pkgs, ... }:

{
  # Wayland tiling compositor
  wayland.windowManager.sway = {
    enable = true;
    checkConfig = false;

    config = {
      modifier = "Mod4";
      terminal = "${pkgs.foot}/bin/foot";
      menu = "${pkgs.fuzzel}/bin/fuzzel";
      defaultWorkspace = "workspace number 1";

      startup = [
        {
          command = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        }
      ];

      input = {
        "type:pointer" = {
          accel_profile = "flat";
          pointer_accel = "0";
        };
      };

      window = {
        commands = [
          {
            command = "allow_tearing yes";
            criteria = {
              instance = "cs2";
            };
          }
        ];
      };

      focus = {
        mouseWarping = "container";
        wrapping = "yes";
      };

      keybindings =
      let
        modifier = config.wayland.windowManager.sway.config.modifier;
      in lib.mkOptionDefault {
        "${modifier}+Print" = "exec ${pkgs.procps}/bin/pidof ${pkgs.slurp}/bin/slurp || ${pkgs.grim}/bin/grim -g \"$(${pkgs.slurp}/bin/slurp)\"";
      };

      gaps = {
        inner = 5;
        smartBorders = "on";
      };

      colors = {
        focused = {
          background = "#285577";
          border = "#4c7899";
          childBorder = "#ffffff";
          indicator = "#2e9ef4";
          text = "#ffffff";
        };

        focusedInactive = {
          background = "#5f676a";
          border = "#333333";
          childBorder = "#ffffff00";
          indicator = "#484e50";
          text = "#ffffff";
        };

        unfocused = {
          background = "#222222";
          border = "#333333";
          childBorder = "#ffffff00";
          indicator = "#292d2e";
          text = "#888888";
        };
      };
      
      bars = [
        {
          command = "${pkgs.waybar}/bin/waybar";
          position = "top";
        }
      ];
    };

    extraConfig = ''
      default_border pixel 2
      default_floating_border pixel 2
    '';
  };
}
