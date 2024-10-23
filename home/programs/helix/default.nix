{ pkgs, pkgs-unstable, ...}:
{
  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      theme = "rose_pine_moon";
      editor = {
        cursorline = true;
        auto-save = true;
        rulers = [ 80 100 ];
        color-modes = true;
        bufferline = "multiple";

        indent-guides.render = true;

        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "block";
        };

        soft-wrap.enable = true;

        whitespace.render = {
          space = "none";
          nbsp = "all";
          nnbsp = "all";
          tab = "all";
          newline = "all";
        };
      };

      keys.normal = {
        "A-é" = "select_next_sibling";
        "’" = "goto_word";
        "C-l" = ":reload-all";
        "space" = {
          "à" = ":write";
          "q" = ":quit";
          "Q" = ":quit!";
        };
      };
    };

    extraPackages = with pkgs; [
      # Nix
      nil

      # Typst
      pkgs-unstable.tinymist

      # Python
      # See: https://github.com/NixOS/nixpkgs/issues/229337
      (python3.withPackages (p: (with p; [
        python-lsp-server
        python-lsp-ruff
      ])))

      # Markdown
      marksman
    ];

    languages = {
      language = [
        {
          name = "typst";
          auto-format = true;
          language-servers = [ "tinymist" ];
        }
      ];
      language-server.tinymist = {
        command = "tinymist";
        # See https://myriad-dreamin.github.io/tinymist/configurations.html
        config = {
          exportPdf = "never";
          semanticTokens = "disable";
          compileStatus = "disable";
          formatterMode = "disable";
          formatterPrintWidth = 80;
        };
      };
    };
  };
}
