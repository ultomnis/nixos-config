{ vars, ... }:

{
  # Define a user account. Don't forget to set a password with passwd
  users.users.${vars.userConfig.name} = {
    isNormalUser = true;
    home = "/home/${vars.userConfig.name}";
    extraGroups = [ "wheel" ];
  };
}
