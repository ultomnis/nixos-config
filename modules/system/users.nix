{ config, userConfig, ... }:

{
  # Define a user account. Don't forget to set a password with passwd
  users.users.${userConfig.username} = {
    isNormalUser = true;
    description = "user";
    extraGroups = [ "wheel" ];
    hashedPasswordFile = config.age.secrets.user-password.path;
  };
}
