{ userConfig, ... }:

{
  # Define a user account. Don't forget to set a password with passwd
  users.users.${userConfig.name} = {
    isNormalUser = true;
    home = "/home/${userConfig.name}";
    description = "user";
    extraGroups = [ "wheel" ];
  };
}
