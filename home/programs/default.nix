{ config, pkgs, ... }:

{
  imports = [
    ./alacritty.nix
    ./direnv.nix
    ./bat.nix
    ./eza.nix
    ./fish
    ./git.nix
    ./jujutsu.nix
    ./zellij
  ];
}

