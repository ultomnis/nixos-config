{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.luminosity.home.tui.helix;

in
{
  # Modal text editor
  programs.helix = {
    inherit (cfg) enable;

    extraPackages = builtins.attrValues {
      inherit (pkgs) lldb_20;
    };

    settings = {
      editor = {
        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };

        cursorline = true;
        indent-guides.render = true;
        line-number = "relative";
      };
    };

    languages = {
      language-server = {
        clangd.command = lib.getExe' pkgs.clang-tools "clangd";
        jdtls.command = lib.getExe pkgs.jdt-language-server;
        marksman.command = lib.getExe pkgs.marksman;
        nixd.command = lib.getExe pkgs.nixd;
        pylsp.command = lib.getExe pkgs.python313Packages.python-lsp-server;

        qmlls = {
          command = lib.getExe' pkgs.kdePackages.qtdeclarative "qmlls";

          args = [
            "-E"
          ];
        };

        rust-analyzer.command = lib.getExe pkgs.rust-analyzer;
        texlab.command = lib.getExe pkgs.texlab;

        typescript-language-server = {
          command = lib.getExe pkgs.typescript-language-server;

          args = [
            "--stdio"
          ];
        };
      };

      language = [
        {
          name = "markdown";

          language-servers = [
            "marksman"
          ];
        }
        {
          name = "nix";
          formatter.command = lib.getExe pkgs.nixfmt-rfc-style;

          language-servers = [
            "nixd"
          ];
        }
        {
          name = "python";

          language-servers = [
            "pylsp"
          ];
        }
      ];
    };
  };
}
