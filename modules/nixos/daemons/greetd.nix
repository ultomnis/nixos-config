{ lib, pkgs, ... }:

{
  # Login manager daemon
  services.greetd = {
    enable = true;
    vt = 2;

    settings = {
      default_session = {
        # Graphical console greeter
        command = "${lib.getExe pkgs.greetd.tuigreet} --time --remember --cmd ${lib.getExe pkgs.sway}";
      };
    };
  };
}
