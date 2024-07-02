{ config, pkgs, ... }:

{
  imports = [
    ./alacritty.nix
    ./bat.nix
    ./direnv.nix
    ./eza.nix
    ./fd.nix
    ./fish
    ./git.nix
    ./helix
    ./jujutsu.nix
    ./ripgrep.nix
    # ./starship.nix
    ./thunderbird.nix
    ./zellij
    ./zoxide.nix
  ];
}

