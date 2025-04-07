{
  # The friendly interactive shell
  programs.fish = {
    enable = true;

    functions = {
      fish_prompt = {
        body = ''
          # Change prompt within a nix shell
          set -l nix_shell_info (
            if test -n "$IN_NIX_SHELL"
              echo -n "<nix-shell> "
            end
          )

          # Appearance of the command line prompt
          printf '%s%s%s%s > ' $nix_shell_info \
            (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
        '';
      };
    };

    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';
  };
}
