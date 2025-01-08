{ userConfig, ... }:

{
  # User configuration
  users.users.${userConfig.name} = {
    description = "user";
    home = "/Users/${userConfig.name}";
  };
}
