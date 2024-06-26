{ config, pkgs, ... }:

{
  imports = [
    ./alacritty.nix
    ./bat.nix
    ./eza.nix
    ./fish
    ./git.nix
    ./jujutsu.nix
    ./zellij
  ];
}

