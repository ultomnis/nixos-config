{ pkgs, ... }:

{
  environment = {
    shells = [ pkgs.fish ];

    variables = {
      HOMEBREW_NO_ANALYTICS = "1";
    };
  };
}
