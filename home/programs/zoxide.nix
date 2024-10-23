let
  shellAliases = {
    cd = "z"; # Replace `cd` altogether
  };
in {
  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };

  # Prefer abbreviations for fish
  programs.fish.shellAbbrs = shellAliases;
}
