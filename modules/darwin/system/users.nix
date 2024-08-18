{ userConfig, ... }:

{
  # User configuration
  users.users.${userConfig.username} = {
    description = "user";
    home = "/Users/${userConfig.username}";
  };
}
