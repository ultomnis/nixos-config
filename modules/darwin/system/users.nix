{ vars, ... }:

{
  # User configuration
  users = {
    users.${vars.userConfig.name} = {
      home = "/Users/${vars.userConfig.name}";
    };
  };
}
