{ config, ... }:

{
  # Define a user account. Don't forget to set a password with passwd
  users.users.user = {
    isNormalUser = true;
    description = "user";
    extraGroups = [ "wheel" ];
    hashedPasswordFile = config.age.secrets.user-password.path;
  };
}
