let
  shellAliases = {
    g = "git";
  };
in {
  programs.git = {
    enable = true;
    userName = "Boris Petrov";
    userEmail = "boris.v.petrov@proton.me";
  };

  # Prefer abbreviations for fish
  programs.fish.shellAbbrs = shellAliases;
}
