{ pkgs, ...}:
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
        "C-l" = ":reload-all";
        "space" = {
          "à" = ":write";
          "q" = ":quit";
          "Q" = ":quit!";
        };
      };
    };

    extraPackages = with pkgs; [
      nil # Nix
      # tinymist # Typst
    ];
  };
}
