{ pkgs, ... }:
let
  src = pkgs.fetchFromGitHub {
    owner = "rose-pine";
    repo = "fish";
    rev = "38aab5baabefea1bc7e560ba3fbdb53cb91a6186";
    hash = "sha256-bSGGksL/jBNqVV0cHZ8eJ03/8j3HfD9HXpDa8G/Cmi8=";
  };
in {
  home.file.".config/fish/themes" = {
    recursive = true;
    source = "${src}/themes";
  };

  programs.fish = {
    enable = true;
    # TODO: wait for theme support
    # https://github.com/nix-community/home-manager/pull/5394
    # plugins = [
    #   {
    #     name = "Rose Pine Theme";
    #     src = pkgs.fetchFromGitHub {
    #       owner = "rose-pine";
    #       repo = "fish";
    #       rev = "38aab5baabefea1bc7e560ba3fbdb53cb91a6186";
    #       hash = "sha256-bSGGksL/jBNqVV0cHZ8eJ03/8j3HfD9HXpDa8G/Cmi8=";
    #     };
    #   }
    # ];
    shellInitLast = ''
      fish_config theme choose "Rosé Pine Moon"
      set -g fish_greeting
    '';

    functions = {
      mkcd = "mkdir $argv[1] && cd $argv[1]";
    };
  };
}
