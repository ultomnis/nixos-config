{ vars, ... }:

{
  # User configuration
  users = {
    knownUsers = [ "${vars.userConfig.name}" ];

    users.${vars.userConfig.name} = {
      description = "user";
      home = "/Users/${vars.userConfig.name}";
      uid = 501;
    };
  };
}
