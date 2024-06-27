let
  shellAliases = {
    jb = "jj branch";
    jd = "jj diff";
    jds = "jj describe";
    js = "jj status";
    jg = "jj git";
    jgf = "jj git fetch";
    jgp = "jj git push";
    jl = "jj log";
    jsq = "jj squash";
    jn = "jj new";
    jnm = "jj new -m";
    jc = "jj commit";
    jcm = "jj commit -m";
  };
in {
  programs.jujutsu = {
    enable = true;
    settings = {
      user = {
        name = "Boris Petrov";
        email = "boris.v.petrov@proton.me";
      };
      # Ideally would use :builtin, but needs to have option to not page if enough space
      ui.pager = "less -FRX";
    };
  };

  # Prefer abbreviations for fish
  programs.fish.shellAbbrs = shellAliases;
}
