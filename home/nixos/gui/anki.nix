{ config, ... }:

let
  cfg = config.luminosity.home.gui.anki;

in
{
  # Flashcard program
  programs.anki = {
    inherit (cfg) enable;
  };

  stylix.targets.anki = {
    inherit (cfg) enable;
  };
}
