{ userConfig, ... }:

{
  security = {
    # Pluggable Authentication Modules
    pam = {
      services = {
        # Automatically unlock keyring
        greetd.enableGnomeKeyring = true;
      };

      # Realtime priority
      loginLimits = [
        {
          domain = "@users";
          item = "rtprio";
          type = "-";
          value = 1;
        }
      ];
    };

    # Realtime policy and watchdog daemon
    rtkit.enable = true;

    sudo.extraConfig = ''
      Defaults passprompt="What? Make it yourself:"
    '';

    # Trusted Platform Module
    tpm2 = {
      enable = true;
      pkcs11.enable = true;
      tctiEnvironment.enable = true;
    };
  };

  users.users.${userConfig.username}.extraGroups = [ "tss" ];
}
