{ userConfig, ... }:

{
  # User configuration
  users = {
    knownUsers = [ "${userConfig.name}" ];

    users.${userConfig.name} = {
      description = "user";
      home = "/Users/${userConfig.name}";
      uid = 501;
    };
  };
}
