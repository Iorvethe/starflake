{ themes, ... }:

let
  shellAliases = {
    cat = "bat";
  };
in {
  programs.bat.enable = true;

  programs.bat.themes = {
    rose-pine = {
      src = themes.bat;
      file = "dist/themes/rose-pine-moon.tmTheme";
    };
  };

  programs.bat.config = {
    theme = "rose-pine";
  };

  # Prefer abbreviations for fish
  programs.fish.shellAbbrs = shellAliases;
}
