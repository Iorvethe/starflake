{ pkgs, ... }:

let
  shellAliases = {
    cat = "bat";
  };
in {
  programs.bat.enable = true;

  programs.bat.themes = {
    rose-pine = {
      src = pkgs.fetchFromGitHub {
        owner = "rose-pine";
        repo = "tm-theme";
        rev = "c4235f9a65fd180ac0f5e4396e3a86e21a0884ec";
        hash = "sha256-jji8WOKDkzAq8K+uSZAziMULI8Kh7e96cBRimGvIYKY=";
      };
      file = "dist/themes/rose-pine-moon.tmTheme";
    };
  };

  programs.bat.config = {
    theme = "rose-pine";
  };

  # Prefer abbreviations for fish
  programs.fish.shellAbbrs = shellAliases;
}