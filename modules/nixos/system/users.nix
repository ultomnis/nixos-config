{ userConfig, ... }:

{
  # Define a user account. Don't forget to set a password with passwd
  users.users.${userConfig.username} = {
    isNormalUser = true;
    home = "/home/${userConfig.username}";
    description = "user";
    extraGroups = [ "wheel" ];
  };
}
