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
        {
          command = "${pkgs.wl-gammarelay-rs}/bin/wl-gammarelay-rs";
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
          {
            command = "floating on, resize set 800 400, move position cursor, move down 30 px";
            criteria = {
              app_id = "pavucontrol";
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
        "${modifier}+Shift+l" = "exec ${pkgs.swaylock}/bin/swaylock -f";
        "${modifier}+Shift+m" = "exec ${pkgs.systemd}/bin/busctl --user set-property rs.wl-gammarelay / rs.wl.gammarelay Temperature q 6500";
        "${modifier}+Shift+n" = "exec ${pkgs.systemd}/bin/busctl --user set-property rs.wl-gammarelay / rs.wl.gammarelay Temperature q 3400";
      };

      gaps = {
        inner = 5;
        smartBorders = "on";
      };

      colors = {
        focused = {
          background = "#285577";
          border = "#4c7899";
          childBorder = "#f0f0f0";
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
