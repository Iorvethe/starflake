let
  shellAliases = {
    g = "git";
    gst = "git status";
    gf = "git fetch";
    gd = "git diff";
    ga = "git add";
    gb = "git branch";
    gc = "git commit --verbose";
    gcm = "git commit --message";
    gloga = "git log --oneline --decorate --graph --all";
    gsw = "git switch";
    gswc = "git switch --create";
    gsta = "git stash push";
    gstp = "git stash pop";
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
