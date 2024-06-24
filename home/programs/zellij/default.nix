let
  shellAliases = {
    zj = "zellij";
    za = "zellij attach";
    ze = "zellij edit -i";
    zr = "zellij run -i";
  };
in {
  programs.zellij = {
    enable = true;
  };

  # Prefer abbreviations for fish
  programs.fish.shellAbbrs = shellAliases;

  xdg.configFile."zellij/config.kdl".source = ./config.kdl;
}
