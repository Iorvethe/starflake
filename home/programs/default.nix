{ config, pkgs, ... }:

{
  imports = [
    ./alacritty.nix
    ./bat.nix
    ./fish
    ./git.nix
    ./jujutsu.nix
    ./zellij
  ];
}

