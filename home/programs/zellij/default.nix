{ pkgs, ... }:
let
  src = pkgs.fetchFromGitHub {
    owner = "rose-pine";
    repo = "zellij";
    rev = "53835422f965e6c88b9ad59e11d343ca4552bf6d";
    hash = "sha256-VNqd1Qt6LibK7M8KirUhtwpVYAvsgn2e96wAf/YMQzI=";
  };
  shellAliases = {
    zj = "zellij";
    za = "zellij attach";
    ze = "zellij edit -i";
    zr = "zellij run -is";
    zw = "zellij -l welcome";
  };
in {
  home.file.".config/zellij/themes" = {
    recursive = true;
    source = "${src}/dist";
  };

  programs.zellij = {
    enable = true;
  };

  # Prefer abbreviations for fish
  programs.fish.shellAbbrs = shellAliases;

  xdg.configFile."zellij/config.kdl".source = ./config.kdl;
}
