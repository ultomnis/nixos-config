{ config, pkgs, ... }:

{
  # Wayland logout menu
  programs.wlogout = {
    enable = true;

    # Layout configuration
    layout = [
      {
        label = "lock";
        action = "${pkgs.swaylock-effects}/bin/swaylock";
        text = "Lock Screen";
        keybind = "l";
      }
      {
        label = "logout";
        action = "${pkgs.systemd}/bin/loginctl terminate-user $USER";
        text = "Log Out";
        keybind = "e";
      }
      {
        label = "reboot";
        action = "${pkgs.systemd}/bin/systemctl reboot";
        text = "Restart";
        keybind = "r";
      }
      {
        label = "shutdown";
        action = "${pkgs.systemd}/bin/systemctl poweroff";
        text = "Shut Down";
        keybind = "s";
      }
    ];

    # CSS
    style = ''
      * {
        background-image: none;
        box-shadow: none;
      }

      window {
        background-color: rgba(0, 0, 0, 0.75);
      }

      button {
        border-radius: 4px;
        color: #f0f0f0;
        background-color: rgba(240, 240, 240, 0.1);
        background-repeat: no-repeat;
        background-position: center;
        background-size: 20%;
        margin: 8px;
      }

      button:focus {
        border-style: solid;
        border-width: 2px;
        border-color: #f0f0f0;
      }

      button:active, button:hover {
        background-color: rgba(240, 240, 240, 0.3);
        border: none;
        outline-style: none;
      }

      #lock {
        background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/lock.png"));
      }

      #logout {
        background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/logout.png"));
      }

      #reboot {
        background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/reboot.png"));
      }

      #shutdown {
        background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/shutdown.png"));
      }
    '';
  };
}
