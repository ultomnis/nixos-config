{ userConfig, ... }:

{
  security = {
    # Pluggable Authentication Modules
    pam = {
      # Realtime process scheduling
      loginLimits = [
        {
          domain = "@users";
          item = "rtprio";
          type = "-";
          value = 1;
        }
      ];
    };

    # RealtimeKit
    rtkit.enable = true;

    sudo.extraConfig = ''
      Defaults passprompt="What? Make it yourself:"
    '';
  };
}
