{ vars, ... }:

{
  # User configuration
  users = {
    knownUsers = [ "${vars.userConfig.name}" ];

    users.${vars.userConfig.name} = {
      home = "/Users/${vars.userConfig.name}";
      uid = vars.uid;
    };
  };
}
