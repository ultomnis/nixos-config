{
  # Swaylock PAM authentication
  security.pam.services.swaylock = {};

  # Trusted Platform Module
  security.tpm2 = {
    enable = true;
    pkcs11.enable = true;
    tctiEnvironment.enable = true;
  };
  users.users.user.extraGroups = [ "tss" ];
}
