{
  # Secure networking utilities
  services.openssh = {
    enable = true;

    settings = {
      PasswordAuthentication = false;
    };
  };
}
