{ themes, ... }:
let
  shellAliases = {
    zl = "zellij";
    za = "zellij attach";
    ze = "zellij edit -i";
    zr = "zellij run -is";
    zw = "zellij -l welcome";
  };
in {
  programs.zellij = {
    enable = true;
  };

  # Prefer abbreviations for fish
  programs.fish.shellAbbrs = shellAliases;

  xdg.configFile = {
    "zellij/config.kdl".source = ./config.kdl;
    "zellij/themes" = {
      source = "${themes.zellij}/dist";
      recursive = true;
    };
    "zellij/layouts" = {
        source = ./layouts;
        recursive = true;
    };
  };
}
